import 'dart:async';
import 'dart:io';

/*
async/await->异步方法只能返回void和Future
 使用async和await的代码是异步的，但是看起来很像是同步的。
 当我们获取得到A的结果，再执行B时，你需要then()->then()方法不断地调用，
 但是利用async与await能够很好的解决多次回调问题。
*/

//async 表示这是一个异步的方法，await必须在async方法中使用
//异步方法只能返回void和Future
Future<String> readFile() async {
  //await 等待future任务执行完，再执行后续代码
  var content = await File(
          r"/Users/shareit/work/androidProjects/studyflutter/lib/类/1-构造方法.dart")
      .readAsString();
  var content2 = await File(
          r"/Users/shareit/work/androidProjects/studyflutter/lib/类/2-getter_setter方法.dart")
      .readAsString();

  return content + content2;
}

void main() {
  readFile().then((content) => print(content));
}
