; ModuleID = 'Person.m'
source_filename = "Person.m"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx11.0.0"

%0 = type opaque
%1 = type opaque
%2 = type opaque
%3 = type opaque
%struct.__NSConstantString_tag = type { i32*, i32, i8*, i64 }
%struct._class_t = type { %struct._class_t*, %struct._class_t*, %struct._objc_cache*, i8* (i8*, i8*)**, %struct._class_ro_t* }
%struct._objc_cache = type opaque
%struct._class_ro_t = type { i32, i32, i32, i8*, i8*, %struct.__method_list_t*, %struct._objc_protocol_list*, %struct._ivar_list_t*, i8*, %struct._prop_list_t* }
%struct.__method_list_t = type { i32, i32, [0 x %struct._objc_method] }
%struct._objc_method = type { i8*, i8*, i8* }
%struct._objc_protocol_list = type { i64, [0 x %struct._protocol_t*] }
%struct._protocol_t = type { i8*, i8*, %struct._objc_protocol_list*, %struct.__method_list_t*, %struct.__method_list_t*, %struct.__method_list_t*, %struct.__method_list_t*, %struct._prop_list_t*, i32, i32, i8**, i8*, %struct._prop_list_t* }
%struct._ivar_list_t = type { i32, i32, [0 x %struct._ivar_t] }
%struct._ivar_t = type { i64*, i8*, i8*, i32, i32 }
%struct._prop_list_t = type { i32, i32, [0 x %struct._prop_t] }
%struct._prop_t = type { i8*, i8* }
%struct._objc_super = type { i8*, i8* }

@__CFConstantStringClassReference = external global [0 x i32]
@.str = private unnamed_addr constant [14 x i8] c"my name is %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_ = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i64 13 }, section "__DATA,__cfstring", align 8 #0
@OBJC_METH_VAR_NAME_ = private unnamed_addr constant [5 x i8] c"name\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_ = internal externally_initialized global i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.1 = private unnamed_addr constant [12 x i8] c"my id is %@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.2 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i64 11 }, section "__DATA,__cfstring", align 8 #0
@OBJC_METH_VAR_NAME_.3 = private unnamed_addr constant [4 x i8] c"idf\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.4 = internal externally_initialized global i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_.3, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.5 = private unnamed_addr constant [14 x i8] c"my name is %p\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.6 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i32 0, i32 0), i64 13 }, section "__DATA,__cfstring", align 8 #0
@.str.7 = private unnamed_addr constant [12 x i8] c"my id is %p\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.8 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i32 0, i32 0), i64 11 }, section "__DATA,__cfstring", align 8 #0
@"OBJC_CLASS_$_NSMethodSignature" = external global %struct._class_t
@"OBJC_CLASSLIST_REFERENCES_$_" = internal global %struct._class_t* @"OBJC_CLASS_$_NSMethodSignature", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@.str.9 = private unnamed_addr constant [4 x i8] c"v@:\00", align 1
@OBJC_METH_VAR_NAME_.10 = private unnamed_addr constant [24 x i8] c"signatureWithObjCTypes:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.11 = internal externally_initialized global i8* getelementptr inbounds ([24 x i8], [24 x i8]* @OBJC_METH_VAR_NAME_.10, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@"OBJC_CLASS_$_Person" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_Person", %struct._class_t* @"OBJC_CLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"_OBJC_CLASS_RO_$_Person" }, section "__DATA, __objc_data", align 8
@"OBJC_CLASSLIST_SUP_REFS_$_" = private global %struct._class_t* @"OBJC_CLASS_$_Person", section "__DATA,__objc_superrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.12 = private unnamed_addr constant [19 x i8] c"forwardInvocation:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.13 = internal externally_initialized global i8* getelementptr inbounds ([19 x i8], [19 x i8]* @OBJC_METH_VAR_NAME_.12, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@.str.14 = private unnamed_addr constant [3 x i8] c"%s\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_.15 = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i64 2 }, section "__DATA,__cfstring", align 8 #0
@"__FUNCTION__.-[Person forwardInvocation:]" = private unnamed_addr constant [29 x i8] c"-[Person forwardInvocation:]\00", align 1
@_objc_empty_cache = external global %struct._objc_cache
@"OBJC_METACLASS_$_NSObject" = external global %struct._class_t
@OBJC_CLASS_NAME_ = private unnamed_addr constant [7 x i8] c"Person\00", section "__TEXT,__objc_classname,cstring_literals", align 1
@"_OBJC_METACLASS_RO_$_Person" = internal global %struct._class_ro_t { i32 1, i32 40, i32 40, i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), %struct.__method_list_t* null, %struct._objc_protocol_list* null, %struct._ivar_list_t* null, i8* null, %struct._prop_list_t* null }, section "__DATA, __objc_const", align 8
@"OBJC_METACLASS_$_Person" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_NSObject", %struct._class_t* @"OBJC_METACLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"_OBJC_METACLASS_RO_$_Person" }, section "__DATA, __objc_data", align 8
@"OBJC_CLASS_$_NSObject" = external global %struct._class_t
@OBJC_METH_VAR_NAME_.16 = private unnamed_addr constant [7 x i8] c"printf\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_ = private unnamed_addr constant [8 x i8] c"v16@0:8\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.17 = private unnamed_addr constant [28 x i8] c"methodSignatureForSelector:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.18 = private unnamed_addr constant [11 x i8] c"@24@0:8:16\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.19 = private unnamed_addr constant [11 x i8] c"v24@0:8@16\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.20 = private unnamed_addr constant [8 x i8] c"@16@0:8\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.21 = private unnamed_addr constant [9 x i8] c"setName:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.22 = private unnamed_addr constant [8 x i8] c"setIdf:\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@"_OBJC_$_INSTANCE_METHODS_Person" = internal global { i32, i32, [7 x %struct._objc_method] } { i32 24, i32 7, [7 x %struct._objc_method] [%struct._objc_method { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_METH_VAR_NAME_.16, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* bitcast (void (%0*, i8*)* @"\01-[Person printf]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([28 x i8], [28 x i8]* @OBJC_METH_VAR_NAME_.17, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_.18, i32 0, i32 0), i8* bitcast (%2* (%0*, i8*, i8*)* @"\01-[Person methodSignatureForSelector:]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @OBJC_METH_VAR_NAME_.12, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_.19, i32 0, i32 0), i8* bitcast (void (%0*, i8*, %3*)* @"\01-[Person forwardInvocation:]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.20, i32 0, i32 0), i8* bitcast (%1* (%0*, i8*)* @"\01-[Person name]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @OBJC_METH_VAR_NAME_.21, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_.19, i32 0, i32 0), i8* bitcast (void (%0*, i8*, %1*)* @"\01-[Person setName:]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_.3, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.20, i32 0, i32 0), i8* bitcast (%1* (%0*, i8*)* @"\01-[Person idf]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_NAME_.22, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_.19, i32 0, i32 0), i8* bitcast (void (%0*, i8*, %1*)* @"\01-[Person setIdf:]" to i8*) }] }, section "__DATA, __objc_const", align 8
@"OBJC_IVAR_$_Person._name" = hidden constant i64 8, section "__DATA, __objc_ivar", align 8
@OBJC_METH_VAR_NAME_.23 = private unnamed_addr constant [6 x i8] c"_name\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.24 = private unnamed_addr constant [12 x i8] c"@\22NSString\22\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@"OBJC_IVAR_$_Person._idf" = hidden constant i64 16, section "__DATA, __objc_ivar", align 8
@OBJC_METH_VAR_NAME_.25 = private unnamed_addr constant [5 x i8] c"_idf\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@"_OBJC_$_INSTANCE_VARIABLES_Person" = internal global { i32, i32, [2 x %struct._ivar_t] } { i32 32, i32 2, [2 x %struct._ivar_t] [%struct._ivar_t { i64* @"OBJC_IVAR_$_Person._name", i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.23, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @OBJC_METH_VAR_TYPE_.24, i32 0, i32 0), i32 3, i32 8 }, %struct._ivar_t { i64* @"OBJC_IVAR_$_Person._idf", i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.25, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @OBJC_METH_VAR_TYPE_.24, i32 0, i32 0), i32 3, i32 8 }] }, section "__DATA, __objc_const", align 8
@OBJC_PROP_NAME_ATTR_ = private unnamed_addr constant [5 x i8] c"name\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_PROP_NAME_ATTR_.26 = private unnamed_addr constant [24 x i8] c"T@\22NSString\22,C,N,V_name\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_PROP_NAME_ATTR_.27 = private unnamed_addr constant [4 x i8] c"idf\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_PROP_NAME_ATTR_.28 = private unnamed_addr constant [23 x i8] c"T@\22NSString\22,C,N,V_idf\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@"_OBJC_$_PROP_LIST_Person" = internal global { i32, i32, [2 x %struct._prop_t] } { i32 16, i32 2, [2 x %struct._prop_t] [%struct._prop_t { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_PROP_NAME_ATTR_, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @OBJC_PROP_NAME_ATTR_.26, i32 0, i32 0) }, %struct._prop_t { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_PROP_NAME_ATTR_.27, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @OBJC_PROP_NAME_ATTR_.28, i32 0, i32 0) }] }, section "__DATA, __objc_const", align 8
@"_OBJC_CLASS_RO_$_Person" = internal global %struct._class_ro_t { i32 0, i32 8, i32 24, i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), %struct.__method_list_t* bitcast ({ i32, i32, [7 x %struct._objc_method] }* @"_OBJC_$_INSTANCE_METHODS_Person" to %struct.__method_list_t*), %struct._objc_protocol_list* null, %struct._ivar_list_t* bitcast ({ i32, i32, [2 x %struct._ivar_t] }* @"_OBJC_$_INSTANCE_VARIABLES_Person" to %struct._ivar_list_t*), i8* null, %struct._prop_list_t* bitcast ({ i32, i32, [2 x %struct._prop_t] }* @"_OBJC_$_PROP_LIST_Person" to %struct._prop_list_t*) }, section "__DATA, __objc_const", align 8
@"OBJC_LABEL_CLASS_$" = private global [1 x i8*] [i8* bitcast (%struct._class_t* @"OBJC_CLASS_$_Person" to i8*)], section "__DATA,__objc_classlist,regular,no_dead_strip", align 8
@llvm.compiler.used = appending global [30 x i8*] [i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_ to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_METH_VAR_NAME_.3, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.4 to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_" to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @OBJC_METH_VAR_NAME_.10, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.11 to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_SUP_REFS_$_" to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @OBJC_METH_VAR_NAME_.12, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.13 to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_METH_VAR_NAME_.16, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @OBJC_METH_VAR_NAME_.17, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_.18, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @OBJC_METH_VAR_TYPE_.19, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.20, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @OBJC_METH_VAR_NAME_.21, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_NAME_.22, i32 0, i32 0), i8* bitcast ({ i32, i32, [7 x %struct._objc_method] }* @"_OBJC_$_INSTANCE_METHODS_Person" to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.23, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @OBJC_METH_VAR_TYPE_.24, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.25, i32 0, i32 0), i8* bitcast ({ i32, i32, [2 x %struct._ivar_t] }* @"_OBJC_$_INSTANCE_VARIABLES_Person" to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_PROP_NAME_ATTR_, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @OBJC_PROP_NAME_ATTR_.26, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @OBJC_PROP_NAME_ATTR_.27, i32 0, i32 0), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @OBJC_PROP_NAME_ATTR_.28, i32 0, i32 0), i8* bitcast ({ i32, i32, [2 x %struct._prop_t] }* @"_OBJC_$_PROP_LIST_Person" to i8*), i8* bitcast ([1 x i8*]* @"OBJC_LABEL_CLASS_$" to i8*)], section "llvm.metadata"

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01-[Person printf]"(%0* %0, i8* %1) #1 {
  %3 = alloca %0*, align 8
  %4 = alloca i8*, align 8
  store %0* %0, %0** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load %0*, %0** %3, align 8
  %6 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %7 = bitcast %0* %5 to i8*
  %8 = call %1* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to %1* (i8*, i8*)*)(i8* %7, i8* %6)
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), %1* %8)
  %9 = load %0*, %0** %3, align 8
  %10 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.4, align 8, !invariant.load !9
  %11 = bitcast %0* %9 to i8*
  %12 = call %1* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to %1* (i8*, i8*)*)(i8* %11, i8* %10)
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.2 to i8*), %1* %12)
  %13 = load %0*, %0** %3, align 8
  %14 = bitcast %0* %13 to i8*
  %15 = getelementptr inbounds i8, i8* %14, i64 8
  %16 = bitcast i8* %15 to %1**
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.6 to i8*), %1** %16)
  %17 = load %0*, %0** %3, align 8
  %18 = bitcast %0* %17 to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 16
  %20 = bitcast i8* %19 to %1**
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.8 to i8*), %1** %20)
  ret void
}

declare void @NSLog(i8*, ...) #2

; Function Attrs: nonlazybind
declare i8* @objc_msgSend(i8*, i8*, ...) #3

; Function Attrs: noinline optnone ssp uwtable
define internal %2* @"\01-[Person methodSignatureForSelector:]"(%0* %0, i8* %1, i8* %2) #1 {
  %4 = alloca %0*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store %0* %0, %0** %4, align 8
  store i8* %1, i8** %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_", align 8
  %8 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.11, align 8, !invariant.load !9
  %9 = bitcast %struct._class_t* %7 to i8*
  %10 = call %2* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to %2* (i8*, i8*, i8*)*)(i8* %9, i8* %8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0))
  ret %2* %10
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01-[Person forwardInvocation:]"(%0* %0, i8* %1, %3* %2) #1 {
  %4 = alloca %0*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %3*, align 8
  %7 = alloca %struct._objc_super, align 8
  store %0* %0, %0** %4, align 8
  store i8* %1, i8** %5, align 8
  store %3* %2, %3** %6, align 8
  %8 = load %0*, %0** %4, align 8
  %9 = load %3*, %3** %6, align 8
  %10 = bitcast %0* %8 to i8*
  %11 = getelementptr inbounds %struct._objc_super, %struct._objc_super* %7, i32 0, i32 0
  store i8* %10, i8** %11, align 8
  %12 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_SUP_REFS_$_", align 8
  %13 = bitcast %struct._class_t* %12 to i8*
  %14 = getelementptr inbounds %struct._objc_super, %struct._objc_super* %7, i32 0, i32 1
  store i8* %13, i8** %14, align 8
  %15 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.13, align 8, !invariant.load !9
  call void bitcast (i8* (%struct._objc_super*, i8*, ...)* @objc_msgSendSuper2 to void (%struct._objc_super*, i8*, %3*)*)(%struct._objc_super* %7, i8* %15, %3* %9)
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_.15 to i8*), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @"__FUNCTION__.-[Person forwardInvocation:]", i64 0, i64 0))
  ret void
}

declare i8* @objc_msgSendSuper2(%struct._objc_super*, i8*, ...)

; Function Attrs: noinline optnone ssp uwtable
define internal %1* @"\01-[Person name]"(%0* %0, i8* %1) #1 {
  %3 = alloca %0*, align 8
  %4 = alloca i8*, align 8
  store %0* %0, %0** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = load %0*, %0** %3, align 8
  %7 = bitcast %0* %6 to i8*
  %8 = tail call i8* @objc_getProperty(i8* %7, i8* %5, i64 8, i1 zeroext false)
  %9 = bitcast i8* %8 to %1*
  ret %1* %9
}

declare i8* @objc_getProperty(i8*, i8*, i64, i1)

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01-[Person setName:]"(%0* %0, i8* %1, %1* %2) #1 {
  %4 = alloca %0*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %1*, align 8
  store %0* %0, %0** %4, align 8
  store i8* %1, i8** %5, align 8
  store %1* %2, %1** %6, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = load %0*, %0** %4, align 8
  %9 = bitcast %0* %8 to i8*
  %10 = load %1*, %1** %6, align 8
  %11 = bitcast %1* %10 to i8*
  call void @objc_setProperty_nonatomic_copy(i8* %9, i8* %7, i8* %11, i64 8)
  ret void
}

declare void @objc_setProperty_nonatomic_copy(i8*, i8*, i8*, i64)

; Function Attrs: noinline optnone ssp uwtable
define internal %1* @"\01-[Person idf]"(%0* %0, i8* %1) #1 {
  %3 = alloca %0*, align 8
  %4 = alloca i8*, align 8
  store %0* %0, %0** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = load %0*, %0** %3, align 8
  %7 = bitcast %0* %6 to i8*
  %8 = tail call i8* @objc_getProperty(i8* %7, i8* %5, i64 16, i1 zeroext false)
  %9 = bitcast i8* %8 to %1*
  ret %1* %9
}

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01-[Person setIdf:]"(%0* %0, i8* %1, %1* %2) #1 {
  %4 = alloca %0*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %1*, align 8
  store %0* %0, %0** %4, align 8
  store i8* %1, i8** %5, align 8
  store %1* %2, %1** %6, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = load %0*, %0** %4, align 8
  %9 = bitcast %0* %8 to i8*
  %10 = load %1*, %1** %6, align 8
  %11 = bitcast %1* %10 to i8*
  call void @objc_setProperty_nonatomic_copy(i8* %9, i8* %7, i8* %11, i64 16)
  ret void
}

attributes #0 = { "objc_arc_inert" }
attributes #1 = { noinline optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nonlazybind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 3]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 1, !"Objective-C Garbage Collection", i8 0}
!5 = !{i32 1, !"Objective-C Class Properties", i32 64}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{!"Apple clang version 12.0.5 (clang-1205.0.22.9)"}
!9 = !{}
