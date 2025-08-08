import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const RequestNetWork());
}

//模拟网络请求
class RequestNetWork extends StatefulWidget {
  const RequestNetWork({super.key});

  @override
  State<RequestNetWork> createState() => _RequestNetWorkState();
}

class _RequestNetWorkState extends State<RequestNetWork> {
  var requestResult = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "模拟Http网络请求",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("模拟Http网络请求"),
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                fetchPost().then((CommonModel commonModel) {
                  setState(() {
                    requestResult = commonModel.toString();
                  });
                });
              },
              splashColor: Colors.blue.withAlpha(100),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // 边框
                  border: Border.all(color: Colors.blue, width: 2),
                  // 边框圆角
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("点击我模拟请求网络"),
                ),
              ),
            ),
            Text(
              requestResult,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Future<CommonModel> fetchPost() async {
    var uri = Uri.https(
        "www.geekailab.com", "io/flutter_app/json/test_common_model.json");
    var response = await http.get(uri);
    return CommonModel.fromJson(convert.jsonDecode(response.body));
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({
    required this.icon,
    required this.title,
    required this.url,
    required this.statusBarColor,
    required this.hideAppBar,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }

  @override
  String toString() {
    return 'icon: $icon\n title: $title\n url: $url\nstatusBarColor: $statusBarColor\n hideAppBar:$hideAppBar \n';
  }
}
