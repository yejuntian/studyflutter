class TestFunction {
  FunctionLearn function = FunctionLearn();

  void start() {
    print(function.sum(1, 2));
    function.anonymousFunction();
  }
}

class FunctionLearn {
  /**
      方法的构成
      返回值类型+方法名+参数
      其中：返回值类型可缺省，也可以为void或具体的类型
      方法名：匿名方法不需要方法名
      参数：参数类型和参数名,参数类型可缺省(另外,参数又分为可选参数和参数默认值)
   */
  int sum(int val1, int val2) {
    return val1 + val2;
  }

  //私有方法:通过_开头命名的方法，私有方法的作用域为当前文件
  _learn() {
    print("FunctionLearn");
  }

  //forEach匿名方法
  anonymousFunction() {
    var list = ['私有方法', '匿名方法'];
    list.forEach((i) {
      print("${list.indexOf(i)}:$i");
    });
  }
}
