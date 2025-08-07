import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:studyflutter/widget/HomePageBanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final CarouselSliderController _buttonCarouselController =
      CarouselSliderController();
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
        child: ListView(
          children: [
            Column(
              children: [
                HomePageBanner(bannerList: bannerList),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
