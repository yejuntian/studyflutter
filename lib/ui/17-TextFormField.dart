import 'package:flutter/material.dart';

/**
    `TextFormField`比`TextField`多了一些属性，其中 ***validator***用于设置验证回调。
    在单独使用时与`TextField`没有太大的区别。当结合`From`，利用`From`可以对输入框进行分组，然后进行一些统一操作(验证)
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

  //全局key
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

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

    var form = Form(key: globalKey, child: colum);

    return MaterialApp(
      title: "焦点控制",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("焦点"),
        ),
        body: Center(
          child: form,
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
