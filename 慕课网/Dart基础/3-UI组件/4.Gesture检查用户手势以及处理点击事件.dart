import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  const GesturePage({super.key});

  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  var printString = '';
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何检测用户手势以及处理点击事件？",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("如何检测用户手势以及处理点击事件？"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _printMsg('点击'),
                    onDoubleTap: () => _printMsg('双击'),
                    onLongPress: () => _printMsg('长按'),
                    onTapCancel: () => _printMsg('取消点击'),
                    onTapUp: (e) => _printMsg('松开'),
                    onTapDown: (e) => _printMsg('按下'),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "点我",
                        style: TextStyle(fontSize: 40, color: Colors.red),
                      ),
                    ),
                  ),
                  Text(printString),
                ],
              ),
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (details) => _doMove(details),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        "随手势进行拖追",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _printMsg(String msg) {
    setState(() {
      printString += msg;
    });
  }

  void _doMove(DragUpdateDetails details) {
    setState(() {
      moveX += details.delta.dx;
      moveY += details.delta.dy;
    });
  }
}
