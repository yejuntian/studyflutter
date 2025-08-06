import 'dart:convert';
import 'dart:io';

/*
  then:得到Future的结果，并且可以返回一个新的Future。
  作用：通过then可以完成 有序任务的执行，一个任务执行完成之后，下一个任务根据上个任务的结果 执行不同的操作

  wait：等待多个异步结果
*/
void main() {
  //Future执行后的结果可以通过then获取
  var fileFuture = File(
          r"/Users/shareit/work/androidProjects/studyflutter/lib/类/1-构造方法.dart")
      .readAsString(encoding: utf8);
  //使用then获取结果

  var result = fileFuture.then((value) {
    print(value);
    return 10;
  }).catchError((e, s) {
    print(e);
  });

  //获取then的返回值结果,只需再次调用then方法即可
  result.then((value) {
    print("获取then的返回值 result = $value");
  });

  //wait等待多个异步结果
  Future.wait([
    Future.delayed(const Duration(seconds: 1)),
    Future.delayed(const Duration(seconds: 2))
  ]).then((value) {
    print("value = $value");
  });
  print("使用forEach进行遍历");
  Future.forEach([1, 2, 3, 4], (element) => print(element));
}
