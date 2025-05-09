import 'dart:isolate';

/*
  IsoLate:Dart中的并发机制，类似Android主线中的main()函数，
  和java Thread不同的是Dart中的IsoLate是无法共享内存的。
*/
void main() {
  Isolate.spawn((message) {
    print("用IsoLate模拟消息通信 message is $message");
  }, "hello");

  var entryPoint = (message) => print("****使用匿名函数的方式message is : $message");
  Isolate.spawn(entryPoint, "我发送了消息");

  //创建一个消息接收器
  var mainReceivePort = ReceivePort();
  //将发送器发送出去
  Isolate.spawn((mainReceivePort) {
    //创建主线程接收器
    var sonReceivePort = ReceivePort();
    var sonSendPort = sonReceivePort.sendPort;
    // mainSendPort.send("1");
    mainReceivePort.send(100);
    //将主线程接收器发送出去
    mainReceivePort.send(sonSendPort);
  }, mainReceivePort.sendPort);

  mainReceivePort.listen((message) {
    //接收到了子IsoLate的发送器
    if (message is SendPort) {
      print("接收到了子IsoLate的发送器");
    } else {
      print("接收到了其他IsoLate的消息 $message");
    }
  });
}
