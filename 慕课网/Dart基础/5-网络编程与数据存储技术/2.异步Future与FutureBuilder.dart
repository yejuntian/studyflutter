import 'dart:math';

// ignore: slash_for_doc_comments
/**
    Future的常见用法
    1.结合future.then获取future的值与捕获异常。
    2.结合async,await
    3.future.whenComplete
    有时候我们需要在Future结束的时候做些事情，我们知道future.then().catchError()的模式类似于
    try-catch,try-catch有个finally代码块，而future.whenComplete就是Future的finally.

    4.future.timeout
    完成一个异步操作可能需要很长时间，比如网络请求，但有时我们需要为异步操作设置一个超时时间，
    ，使用future.timeout就可以做到。

    FutureBuilder
    FutureBuilder是一个将一步操作和异步UI更新结合在一起的类，通过它我们可以将网络请求，数据库读取的结果更新在页面上。
    案例：

 */
void main() {
  print("******1.使用Future.then获取future的值与捕获future的异常********");
  testFuture_then().then((value) {
    print(value);
  }, onError: (e) {
    //如果catchError和onError同时存在，则只会调用onError
    print('onError');
    print(e);
  }).catchError((e) {
    print("catchError");
    print(e);
  });

  print("******2.Future是异步的，如果我们将异步转同步，可以借助async await 来完成********");
  print("t1:${DateTime.now().toString()}");
  test_async_await();
  print("t2:${DateTime.now().toString()}");

  print("******3.Future的whenComplete()********");
  testFuture_whenComplete();

  print("******4.Future的timeOut()********");
  testFuture_timeOut();
}

void testFuture_whenComplete() {
  var random = Random();
  Future.delayed(const Duration(seconds: 3), () {
    if (random.nextBool()) {
      return 100;
    } else {
      throw "boom!";
    }
  }).then(print).catchError(print).whenComplete(() {
    print("done1");
  });
}

void test_async_await() async {
  int result = await Future.delayed(const Duration(microseconds: 2000), () {
    return Future.value(123);
  });
  print("t3:${DateTime.now().toString()}");
  print(result);
}

Future<String> testFuture_then() async {
  // throw Error();
  return Future.value("success");
  // return Future.error("error");
}

void testFuture_timeOut() {
  Future.delayed(const Duration(seconds: 5), () {
    print("testFuture_timeOut");
    return 1;
  }).timeout(const Duration(seconds: 2)).then(print).catchError(print);
}
