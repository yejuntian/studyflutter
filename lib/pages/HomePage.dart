import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _buttonCarouselController =
      CarouselSliderController();
  final List<String> bannerList = [
    "https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
    "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
    "http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg",
    "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg"
  ];
  int _currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SafeArea 会根据设备的 状态栏、高度、底部手势区域 自动调整内边距,可以保证你的轮播图（或任何 widget）不会被系统 UI 遮挡
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    carouselController: _buttonCarouselController,
                    options: CarouselOptions(
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        _buttonCarouselController.jumpToPage(index);
                        setState(() {
                          _currentBannerIndex = index;
                        });
                      },
                      initialPage: _currentBannerIndex,
                      // ⚠️ 设置为 false，避免缩放效果带来的边距
                      enlargeCenterPage: false,
                      // ✅ 关键设置：让每页占满屏幕宽度
                      viewportFraction: 1.0,
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    items: _getBannerImageList(),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _getBannerIndicator(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //获取轮播图图片列表
  List<Widget> _getBannerImageList() {
    return bannerList.map((imageUrl) {
      return SizedBox(
        height: 160,
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
      );
    }).toList();
  }

//获取轮播指示器
  List<Widget> _getBannerIndicator() {
    return bannerList.asMap().entries.map((entry) {
      return GestureDetector(
        onTap: () => _buttonCarouselController.animateToPage(entry.key),
        child: Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
                .withOpacity(_currentBannerIndex == entry.key ? 0.9 : 0.4),
          ),
        ),
      );
    }).toList();
  }
}
