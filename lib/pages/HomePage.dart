import 'package:flutter/material.dart';
import 'package:studyflutter/widget/HomePageBanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  double appBarAlpha = 0;
  final List<String> bannerList = [
    "https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
    "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
    "http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg",
    "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    // 保证 KeepAlive 生效
    super.build(context);
    return Scaffold(
      //SafeArea 会根据设备的 状态栏、高度、底部手势区域 自动调整内边距,可以保证你的轮播图（或任何 widget）不会被系统 UI 遮挡
      body: SafeArea(
        //MediaQuery用来移除ListView默认自带的top padding
        child: Stack(
          children: [
            MediaQuery.removePadding(
              context: context,
              //一定加上这个属性，否则不生效
              removeTop: true,
              //NotificationListener 监听所有列表组件的滚动
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  //判断滚动位置发生了变化时触发且depth == 0（depth == 0含义限定只监听最外层的滚动）
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    //滚动且是列表滚动的时候
                    _onScroll(scrollNotification.metrics.pixels);
                    //如果你希望“自己处理了”这个通知，就返回 true
                    return true;
                  } else {
                    //如果你希望通知“继续上传”给其他父级监听者，返回 false
                    return false;
                  }
                },
                child: ListView(
                  children: [
                    Column(
                      children: [
                        HomePageBanner(bannerList: bannerList),
                        Container(
                          color: Colors.red,
                          height: 800,
                          child: Text("哈哈"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: appBarAlpha,
              child: Container(
                height: 80,
                decoration: const BoxDecoration(color: Colors.white),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Text("首页"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onScroll(double offset) {
    double alpha = offset / 120;
    if (offset < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    print("offset = $offset alpha = $alpha");
    setState(() {
      appBarAlpha = alpha;
    });
  }
}
