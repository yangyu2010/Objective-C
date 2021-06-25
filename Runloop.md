Runloop.md

##1.什么是RunLoop
    Runloop简单来说就是一个do-while循环
    我们的程序需要一种机制, 有事情做的时候做事情, 没有事情做的时候休息.这样是为了保持随时能处理事情, 也可以节省CPU开销.

##2.RunLoop怎么创建的
    每个线程都有一个并且唯一的Runloop, Runloop不会自动创建, 是在第一次获取的时候创建的, 类似于懒加载.\d
    所有的Runloop都存在一个全局字典中, 线程是Key, RunLoop对象是Value.

##3.RunLoop内部结构
```
struct __CFRunLoop {
    CFRuntimeBase _base;
    pthread_mutex_t _lock;			/* locked for accessing mode list */
    __CFPort _wakeUpPort;			// used for CFRunLoopWakeUp 
    Boolean _unused;
    volatile _per_run_data *_perRunData;              // reset for runs of the run loop
    pthread_t _pthread;
    uint32_t _winthread;
    CFMutableSetRef _commonModes;
    CFMutableSetRef _commonModeItems;
    CFRunLoopModeRef _currentMode;
    CFMutableSetRef _modes;
    struct _block_item *_blocks_head;
    struct _block_item *_blocks_tail;
    CFAbsoluteTime _runTime;
    CFAbsoluteTime _sleepTime;
    CFTypeRef _counterpart;
};
```
其中主要关注的有以下几个
```
struct __CFRunLoop {
    pthread_t _pthread;       
    CFMutableSetRef _commonModes;
    CFMutableSetRef _commonModeItems;
    CFRunLoopModeRef _currentMode;
    CFMutableSetRef _modes;
};
```
_modes是一个mode集合 mode类似是 `__CFRunLoopMode`
```
struct __CFRunLoopMode {
    // 删除了一些
    
    // Mode Name
    CFStringRef _name;

    // 触摸事件 
    // performSelector:onThread:
    CFMutableSetRef _sources0;  

    // Port线程通信
    // 系统事件捕捉
    CFMutableSetRef _sources1;

    // 监听RunLoop状态
    // UI刷新
    // Autorelease pool
    CFMutableArrayRef _observers;

    // 定时器
    // performSelector:withObject:afterDelay:
    CFMutableArrayRef _timers;
};
```

##4.RunLoop的运行逻辑
```
SInt32 CFRunLoopRunSpecific(CFRunLoopRef rl, CFStringRef modeName, CFTimeInterval seconds, Boolean returnAfterSourceHandled) {     /* DOES CALLOUT */
        
    // 通知Observers 进入RunLoop
    __CFRunLoopDoObservers(rl, currentMode, kCFRunLoopEntry);
    
    // 做事情
	result = __CFRunLoopRun(rl, currentMode, seconds, returnAfterSourceHandled, previousMode);
    
    // 通知Observers 离开RunLoop
    __CFRunLoopDoObservers(rl, currentMode, kCFRunLoopExit);
    
    return result;
}
```
```
static int32_t __CFRunLoopRun(CFRunLoopRef rl, CFRunLoopModeRef rlm, CFTimeInterval seconds, Boolean stopAfterHandle, CFRunLoopModeRef previousMode) {
    
    
    int32_t retVal = 0;
    do {
        
        // 通知Observers 开始处理Timers
        __CFRunLoopDoObservers(rl, rlm, kCFRunLoopBeforeTimers);
        
        // 通知Observers 开始处理Sources
        __CFRunLoopDoObservers(rl, rlm, kCFRunLoopBeforeSources);

        // 处理 Blocks
        __CFRunLoopDoBlocks(rl, rlm);

        // 处理Source0
        Boolean sourceHandledThisLoop = __CFRunLoopDoSources0(rl, rlm, stopAfterHandle);
        if (sourceHandledThisLoop) {
            // 有可能再次处理 Blocks
            __CFRunLoopDoBlocks(rl, rlm);
        }

        // 如果有Source1 就是需要处理GCD的事件
        if (__CFRunLoopServiceMachPort(dispatchPort, &msg, sizeof(msg_buffer), &livePort, 0, &voucherState, NULL)) {
            goto handle_msg;
        }
        
        // 如果没有Source1 通知Observes开始休眠
        __CFRunLoopDoObservers(rl, rlm, kCFRunLoopBeforeWaiting);
        __CFRunLoopSetSleeping(rl);
        
        // 等待消息唤醒 阻塞到当前
        do {
            __CFRunLoopServiceMachPort(waitSet, &msg, sizeof(msg_buffer), &livePort, poll ? 0 : TIMEOUT_INFINITY, &voucherState, &voucherCopy);
        } while (1);

        // 如果没有Source1 通知Observes结束休眠
        __CFRunLoopUnsetSleeping(rl);
        __CFRunLoopDoObservers(rl, rlm, kCFRunLoopAfterWaiting);

handle_msg:;
        
        if (被time唤醒) {
            __CFRunLoopDoTimers(rl, rlm, mach_absolute_time())
        }
        else if (被GCD唤醒) {
            __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__(msg);
        } else {
            // 被Source1 唤醒
            __CFRunLoopDoSource1(rl, rlm, rls, msg, msg->msgh_size, &reply) || sourceHandledThisLoop;
        }
        
        // 处理Blocks
        __CFRunLoopDoBlocks(rl, rlm);
        
        // 根据返回值 判断是退出还是返回前面继续处理
        if (sourceHandledThisLoop && stopAfterHandle) {
            retVal = kCFRunLoopRunHandledSource;
            } else if (timeout_context->termTSR < mach_absolute_time()) {
                retVal = kCFRunLoopRunTimedOut;
        } else if (__CFRunLoopIsStopped(rl)) {
                __CFRunLoopUnsetStopped(rl);
            retVal = kCFRunLoopRunStopped;
        } else if (rlm->_stopped) {
            rlm->_stopped = false;
            retVal = kCFRunLoopRunStopped;
        } else if (__CFRunLoopModeIsEmpty(rl, rlm, previousMode)) {
            retVal = kCFRunLoopRunFinished;
        }
            
    } while (0 == retVal);

    
    return retVal;
}
```