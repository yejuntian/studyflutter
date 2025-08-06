import 'package:flutter/material.dart';

/**
    FocusNode: 与Widget绑定，代表了这个Widget的焦点

    FocusScope: 焦点控制范围

    FocusScopeNode：控制焦点

    获取输入内容有两种方式：
    1. 定义两个变量，用于保存用户名和密码，然后在onChange触发时，各自保存一下输入内容。
    2. 通过controller直接获取。
 */
void main() {
  //可点击的Icon。
  runApp(const TextFocusWidget());
}

class TextFocusWidget extends StatefulWidget {
  const TextFocusWidget({super.key});

  @override
  State<TextFocusWidget> createState() => _TextFocusStateState();
}

class _TextFocusStateState extends State<TextFocusWidget> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  //定义一个controller
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var colum = Column(
      children: [
        TextField(
          autofocus: true,
          //关联焦点
          focusNode: focusNode1,
          //设置键盘动作为,下一步
          textInputAction: TextInputAction.next,
          //点击下一步执行回调
          onEditingComplete: () {
            //获得context对应UI树的焦点控制范围 的焦点控制器
            FocusScopeNode focusScopeNode = FocusScope.of(context);
            //将焦点交给focusNode2
            focusScopeNode.requestFocus(focusNode2);
          },
          decoration: const InputDecoration(
            labelText: "用户名",
            hintText: "用户名或密码",
            prefixIcon: Icon(Icons.person),
          ),
          onChanged: (inputText) {
            debugPrint("inputText:$inputText");
          },
          controller: controller,
        ),
        TextField(
          //隐藏正在编辑的文本
          obscureText: true,
          focusNode: focusNode2,
          decoration: const InputDecoration(
            labelText: "密码",
            hintText: "您登陆的密码",
            prefixIcon: Icon(Icons.lock),
          ),
          onChanged: (inputText) {
            debugPrint("inputText:$inputText");
          },
          // controller: controller,
        ),
      ],
    );
    return MaterialApp(
      title: "焦点控制",
      home: Scaffold(
        appBar: AppBar(
          title: Text("焦点"),
        ),
        body: Center(
          child: colum,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    controller.dispose();
  }
}
