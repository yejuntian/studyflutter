import 'dart:io';
import 'dart:isolate';

/*
  同AndroidHandler类似，在Dart运行环境中是靠事件驱动的，
  通过event loop 不听的从队列中获取消息或者事件来驱动整个应用的运行，
  IsoLate发过来的消息就是通过loop处理，但是不同的是在Android中每个线程
  只有一个loop对应MessageQueue，而Dart中有两个队列，一个叫event queue(事件队列)，
  另一个叫microtask queue(微任务队列)


  图片路径-->异步/消息机制.png
  Dart在执行main函数后，(说明loop在main()函数之后执行)就有由loop开始执行两个队列中的event，首先Loop检查微服务队列，
  依次执行Event，当微服务队列执行完后，就检查Event queue队列依次执行，在执行Event queue过程中，
  每执行完一个Event就再检查一次微服务队列，所以微服务队列优先级最高，可以利用微服务进行插队。
*/
void main() {
  var mainReceivePort = ReceivePort();
  mainReceivePort.listen((message) {
    print(message);
    //Event loop每次执行完Event 会检查有微服务，有微服务则进行插队操作。
    Future.microtask(() => {print("**微任务开始插队**")});
  });

  //在微任务队列提交一个任务
  Future.microtask(() => print("微任务1"));
  mainReceivePort.sendPort.send("发送消息给消息接收器1");

  Future.microtask(() => print("微任务2"));
  mainReceivePort.sendPort.send("发送消息给消息接收器2");

  Future.microtask(() => {
        print("微任务3"),
        print("***sleep 5s 执行微任务4***"),
        //微任务延时5秒后，执行任务队列
        sleep(const Duration(seconds: 5)),
      });
  mainReceivePort.sendPort.send("发送消息给消息接收器3");

  Future.microtask(
      () => {print("微任务4"), print("******微任务执行完后，执行Event queue队列中的事件")});
  mainReceivePort.sendPort.send("发送消息给消息接收器4");

  print("***********说明微任务队列是在main函数执行后开始的**************");
  sleep(Duration(seconds: 2));
  print("***********Sleep 2s 后任务队列开始执行**************");
}
