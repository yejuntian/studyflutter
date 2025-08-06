void fun() {
  print("我是一个方法");
}

//定义一个Listener的方法，可以接受2个String类型的参数
typedef Listener = Function(String result, String result2);
//或者定义下面的形式
//定义一个类型：Listener2类型，这个类型其实就是一个方法，接收一个String参数，返回void
typedef void Listener2(String result);

void fun2([int i = 1, int j = 2]) {
  print("i = $i j= $j");
}

void fun3({int i = 2, j = 3}) {
  print("i = $i j= $j");
}

void main() {
  /**
   * 1.方法Function
   *  方法也是对象并且具有一种 类型  `Function`。 这意味着，方法可以赋值给变量，也可以当做其他方法的参数
   *  eg:
   *  Function function = fun;
   *  function();
   *
   * java中使用接口作为回调
   * class OnClickListener{
   *  void onClick(){}
   *  }
   *
   *  class Button{
   *  void setOnClickListener(OnClickListener listener){
   *        listener.onClick();
   *      }
   *  }
   *
   *  Dart中可以直接使用回调方法
   *  typedef void onClick();
   *
   *  class Button1{
   *    void setOnClickListener(onClick listener){
   *        listener();
   *    }
   *  }
   *
   *（1）方法具有多个参数
   *   eg:
   *   //1.定义方法
   *   typedef Listener = Function(String result, String result2);
   *
   *   //2.将方法作为参数
   *   void setListener(Listener listener) {
   *      listener("result", "result2");
   *    }
   *
   *   //3.调用方法
   *   setListener((result, result2) => print("$result $result2"));
   *
   *
   *  2.可选位置参数,可以设置默认参数
   * 第一种形式：
   * void fun2([int i = 1, int j = 2]) {
   *    print("i = $i j=$j");
   *  }
   *  第二种形式：
   *  void fun3({int i = 2, j = 3}) {
   *    print("i = $i j= $j");
   *    }
   *
   */
  Function function = fun;
  function();

  print("******** 多个参数类型的方法，方式一 ********");
  void setListener(Listener listener) {
    listener("result", "result2");
  }

  setListener((result, result2) => print("$result $result2"));

  print("******** 多个参数类型的方法，方式二 ********");
  void setListener2(Listener2 listener) {
    listener("方式2");
  }

  setListener2((result) {
    print(result);
  });

  print("******** 可选位置参数 ********");
  fun2(11, 6);
  print("******** 可选命名参数 ********");
  fun3(j: 4, i: 2);
}
