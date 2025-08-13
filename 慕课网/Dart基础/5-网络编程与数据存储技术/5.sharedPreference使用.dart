import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ShredPreference());
}

class ShredPreference extends StatefulWidget {
  const ShredPreference({super.key});

  @override
  State<ShredPreference> createState() => _ShredPreferenceState();
}

class _ShredPreferenceState extends State<ShredPreference> {
  String countString = "";
  int localCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShredPreference的使用",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ShredPreference的使用"),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            //crossAxisAlignment 设置对齐方式，默认居中显示
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: _incrementCounter,
                style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.blue, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Increment Counter"),
              ),
              TextButton(
                onPressed: _getCounter,
                style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.red, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Get Counter"),
              ),
              TextButton(
                onPressed: _resetCounter,
                style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.red, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Reset Counter"),
              ),
              Text(
                countString,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "result:$localCount",
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _incrementCounter() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      countString = "${countString}1";
    });
    int count = (sharedPreferences.getInt("counter") ?? 0) + 1;
    await sharedPreferences.setInt("counter", count);
  }

  void _getCounter() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      localCount = sharedPreferences.getInt("counter") ?? 0;
    });
  }

  void _resetCounter() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("counter");
    setState(() {
      countString = "";
      localCount = 0;
    });
  }
}
