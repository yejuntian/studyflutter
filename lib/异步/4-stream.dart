/*
Future:表示稍后获取的一个数据，所有一部获取的值都用Future来表示，
  但Future只表示一次获取的数据。
Stream：表示多次获取的数据，比如IO操作，每次读取一部分数据，占用内存小，
File中的readAsString()是一次读取整个文件内容，如果文件过大会占用很多内存。

`listen()`其实就是订阅这个Stream，它会返回一个`StreamSubscription`订阅者。
订阅者肯定就提供了取消订阅的`cancel()`，去掉后我们的listen中就接不到任何信息了。
除了`cancel()`取消方法之外，我们还可以使用`onData()`重置listene方法，`onDone`监听完成等等操作。

*/

import 'dart:io';

void main() {
  Stream<List<int>> stream = File(
          r"/Users/shareit/work/androidProjects/studyflutter/lib/类/1-构造方法.dart")
      .openRead();

  //写入文件
  File writeFile = File(
      r"/Users/shareit/work/androidProjects/studyflutter/lib/类/1-构造方法2.dart");
  var listen = stream.listen((event) {
    print(event);
    //写入文件字节
    writeFile.openWrite().add(event);
  });

  listen.onDone(() {
    print("监听文件操作完成");
  });
}
