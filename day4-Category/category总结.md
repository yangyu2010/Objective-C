category 总结
category 本质是 category_t 这样的结构体
category_t 里面有 实例方法列表 类方法列表 属性 协议等

```
struct _category_t {
	const char *name;
	struct _class_t *cls;
	const struct _method_list_t *instance_methods;
	const struct _method_list_t *class_methods;
	const struct _protocol_list_t *protocols;
	const struct _prop_list_t *properties;
};
```

通过 runtime 加载类的所有 category 数据

一个类的所有 category 的方法 属性 协议会合并到一个大数组中, 然后将合并后的数据插入到原来数据的前面,
后编译的 category 数据, 会在数组前面

先开辟内存, 然后把之前的数据memmove到后面, 然后memcopy到前面



+load 方法会在 runtime 加载类, 分类时调用
每个类, 分类的 +load, 在程序运行时只会调用一次

调用顺序
先调用所有的类的+load方法
按编译顺序, 子类先要调用父类的+load


再调用所有分类的+load方法
按编译顺序