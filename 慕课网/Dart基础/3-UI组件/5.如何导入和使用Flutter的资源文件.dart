import 'package:flutter/material.dart';

//如何如何导入和使用Flutter的资源文件?
class ResPage extends StatefulWidget {
  const ResPage({super.key});

  @override
  State<ResPage> createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何如何导入和使用Flutter的资源文件?",
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("如何如何导入和使用Flutter的资源文件?"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: const Center(
          child: Image(
            width: 100,
            height: 100,
            image: AssetImage("images/avatar.png"),
          ),
        ),
      ),
    );
  }
}
