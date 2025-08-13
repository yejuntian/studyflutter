import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const RequestNetWork());
}

//模拟使用FutureBuilder网络请求
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
      title: "FutureBuilder模拟网络请求",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FutureBuilder模拟网络请求"),
        ),
        body: FutureBuilder(
          future: fetchPost(),
          builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
            return getWidget(snapshot);
          },
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

  Widget getWidget(AsyncSnapshot<CommonModel> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return const Text("Input a URL to Start");
      case ConnectionState.waiting:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.active:
        return Text("");
      case ConnectionState.done:
        if (snapshot.hasError) {
          return Text(
            "${snapshot.error}",
            style: const TextStyle(color: Colors.red),
          );
        } else {
          CommonModel? commonModel = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title:${commonModel?.title}"),
              Text("Icon:${commonModel?.icon}"),
              Text("Url:${commonModel?.url}"),
              Text("StatusBarColor:${commonModel?.statusBarColor}"),
              Text("HideAppBar:${commonModel?.hideAppBar}"),
            ],
          );
        }
    }
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
