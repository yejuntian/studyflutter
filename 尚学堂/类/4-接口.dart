/*
 没有interface关键字，Dart中每个类都隐士的定义了一个包含所有实例成员的接口。
*/
class Listener {
  void complete() {}

  void failed() {}
}


class MyListener implements Listener{
  @override
  void complete() {
  }

  @override
  void failed() {
  }

}