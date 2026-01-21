import 'package:flutter/material.dart';
import 'package:studyflutter/widget/webview.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // 保证 KeepAlive 生效
    super.build(context);
    return Scaffold(
        body: Webview(
      url: "https://m.ctrip.com/webapp/myctrip/",
      hideAppBar: true,
      backForbid: true,
      statusBarColor: '4c5bca',
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
