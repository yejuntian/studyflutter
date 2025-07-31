import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//如何打开第三方应用？
class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何打开第三方应用？",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("如何打开第三方应用？"),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => _launchUrl(),
                child: const Text("Show Flutter homepage"),
              ),
              ElevatedButton(
                onPressed: () => _launchBrowser(),
                child: const Text("打开浏览器"),
              ),
              ElevatedButton(
                onPressed: () => _openMap(),
                child: const Text("打开地图"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception("Could not launch $url");
    }
  }

  Future<void> _launchBrowser() async {
    Uri url = Uri.parse('http://www.devio.org/');
    if (!await launchUrl(url)) {
      throw Exception("Could not launch $url");
    }
  }

  Future<void> _openMap() async {
    // Android
    Uri url = Uri.parse('geo:52.32,4.917'); // 正确转换
    if (!await launchUrl(url)) {
      throw Exception("Could not launch $url");
    }
  }
}
