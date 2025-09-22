import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:studyflutter/model/common_model.dart';
import 'package:studyflutter/util/navigator_util.dart';
import 'package:studyflutter/widget/webview.dart';

//首页轮播图
class HomePageBanner extends StatefulWidget {
  final List<CommonModel> bannerList;

  const HomePageBanner({
    required this.bannerList,
    super.key,
  });

  @override
  State<HomePageBanner> createState() => _HomePageBannerState();
}

class _HomePageBannerState extends State<HomePageBanner> {
  int _currentBannerIndex = 0;
  final CarouselSliderController _buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          widthFactor: 1,
          child: CarouselSlider(
            carouselController: _buttonCarouselController,
            options: CarouselOptions(
              onPageChanged: (int index, CarouselPageChangedReason reason) {
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
    );
  }

  //获取轮播图图片列表
  List<Widget> _getBannerImageList() {
    return widget.bannerList.map((model) {
      return GestureDetector(
        onTap: () {
          NavigatorUtil.push(
            context,
            Webview(
              url: model.url ?? "",
              statusBarColor: model.statusBarColor,
              hideAppBar: true,
            ),
          );
        },
        child: Image.network(
          model.icon ?? "",
          fit: BoxFit.fill,
        ),
      );
    }).toList();
  }

//获取轮播指示器
  List<Widget> _getBannerIndicator() {
    return widget.bannerList.asMap().entries.map((entry) {
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
