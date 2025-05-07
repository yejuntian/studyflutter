void test() {
  throw Exception("我抛出了一个异常");
}

void test2() {
  throw "daf";
}

void main() {
  /***
      try {
      throw 123;
      } on int catch(e){//使用 on 指定捕获int类型的异常对象

      } catch(e,s){//函数 catch() 可以带有一个或者两个参数， 第一个参数为抛出的异常对象， 第二个为堆栈信息 ( StackTrace 对象)
      //使用 `rethrow` 关键字可以 把捕获的异常给 重新抛出
      rethrow;

      } finally{

      }
   */
  print("*********1.介绍异常的参数*************");
  try {
    test();
  } catch (exception, stack) {
    //抛出异常对象
    print(exception.runtimeType);
    print(exception);
    //调用栈信息
    print(stack.runtimeType);
    print(stack);
  }

  print("*********2.根据不同异常类型进行不同处理,使用on TYPE catch *************");

  try {
    test2();
  } on int catch (e) {
    print("int");
  } on String catch (e) {
    print("String");
  } on Function catch (e) {
    print("function");
  } on Exception catch (e, stack) {
    print("Exception");
    print(e.runtimeType);
  } finally {
    print("最终执行finally");
  }
}
