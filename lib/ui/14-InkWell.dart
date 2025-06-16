import 'package:flutter/material.dart';

/**
    水波纹。
 */
void main() {
  //可点击的Icon。
  runApp(const _IconButton());
}

class _IconButton extends StatelessWidget {
  const _IconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ElevatedButton",
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: InkWell(
            onTap: () {},
            splashColor: Colors.blue.withAlpha(100),
            borderRadius: BorderRadius.circular(12),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text("自定义水波纹"),
            ),
          ),
        ),
      ),
    );
  }
}
