/*
Future:表示稍后获取的一个数据，所有一部获取的值都用Future来表示，
  但Future只表示一次获取的数据。
Stream：表示多次获取的数据，比如IO操作，每次读取一部分数据，占用内存小，
File中的readAsString()是一次读取整个文件内容，如果文件过大会占用很多内存。

*/

import 'dart:async';
import 'dart:io';

/*
 Steam有两种订阅模式：单订阅和多订阅。
  单订阅：只能有一个订阅者。
  多订阅：通过Stream.asBroadcastStream()将一个单订阅模式的Steam转换成一个多订阅模式的Steam，
  isBroadCast属性可以判断当前Steam所处的订阅模式。
*/
void main() {
  Stream<List<int>> stream = File(
          r"/Users/shareit/work/androidProjects/studyflutter/lib/类/1-构造方法.dart")
      .openRead();

  //多次调用listen会报错
  try {
    var listen = stream.listen((event) {
      print(event);
    });
  } catch (e) {
    print(e.toString());
  }

  //转变为广播模式
  var asBroadcastStream = stream.asBroadcastStream();
  asBroadcastStream.listen((event) {
    print("listen1");
  });

  asBroadcastStream.listen((event) {
    print("listen2");
  });

  //******************单订阅转换来的广播************************
  var streamIterable = Stream.fromIterable([1, 2, 3, 4]);
  var asBroadcastStream2 = streamIterable.asBroadcastStream();

  asBroadcastStream2.listen((event) {
    print("订阅者1 $event");
  });

  asBroadcastStream2.listen((event) {
    print("订阅者2 $event");
  });

  //******************直接创建的广播************************

  //直接创建一个广播，必须在发送数据前进行监听，才能监听到数据
  var streamController = StreamController.broadcast();
  //发送2条广播
  streamController.add("event1");
  streamController.add("event2");

  //不能监听到发送的广播数据
  streamController.stream.listen((event) {
    print("event = $event");
  });
  //只能监听到事件event3；不能监听到event1和event2
  streamController.add("event3");

  //关闭广播
  streamController.close();
}
