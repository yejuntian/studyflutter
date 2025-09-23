// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart' hide SearchBar;
import 'package:studyflutter/dao/home_dao.dart';
import 'package:studyflutter/model/home_model.dart';
import 'package:studyflutter/widget/HomePageBanner.dart';
import 'package:studyflutter/widget/loading_container.dart';
import 'package:studyflutter/widget/local_nav.dart';
import 'package:studyflutter/widget/sales_box.dart';
import 'package:studyflutter/widget/search_bar.dart';

import '../model/common_model.dart';
import '../model/grid_nav_model.dart';
import '../model/sales_box_model.dart';
import '../widget/grid_nav.dart';
import '../widget/sub_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  double appBarAlpha = 0;
  List<CommonModel> bannerList = [];
  List<CommonModel>? localNavList = [];
  GridNavModel? gridNav;
  List<CommonModel>? subNavList = [];
  SalesBoxModel? salesBox;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // 保证 KeepAlive 生效
    super.build(context);
    return Scaffold(
      //SafeArea 会根据设备的 状态栏、高度、底部手势区域 自动调整内边距,可以保证你的轮播图（或任何 widget）不会被系统 UI 遮挡
      body: LoadingContainer(
        isLoading: isLoading,
        child: SafeArea(
          //MediaQuery用来移除ListView默认自带的top padding
          child: Stack(
            children: [
              MediaQuery.removePadding(
                context: context,
                //一定加上这个属性，否则不生效
                removeTop: true,
                //NotificationListener 监听所有列表组件的滚动
                child: RefreshIndicator(
                  onRefresh: _handRefresh,
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
                    child: _listView,
                  ),
                ),
              ),
              _appBar,
            ],
          ),
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

  Future<Null> loadData() async {
    try {
      HomeModel homeModel = await HomeDao.fetch();
      setState(() {
        localNavList = homeModel.localNavList;
        bannerList = homeModel.bannerList!;
        gridNav = homeModel.gridNav!;
        subNavList = homeModel.subNavList;
        salesBox = homeModel.salesBox;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _handRefresh() async {
    loadData();
    return;
  }

  Widget get _listView {
    return ListView(
      children: [
        Column(
          children: [
            HomePageBanner(bannerList: bannerList),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
              child: LocalNav(
                localNavList: localNavList,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
              child: GridNav(gridNavModel: gridNav),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
              child: SubNav(subNavList: subNavList),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 7, 4),
              child: SalesBox(salesBox: salesBox),
            ),
          ],
        )
      ],
    );
  }

  /**
   * 当页面刚进入时（appBarAlpha=0），AppBar 背景完全透明，只能看到渐变遮罩和搜索框。
   * 随着页面往下滑，appBarAlpha 逐渐增加，AppBar 背景慢慢变成白色 → 最终是一个普通的白色搜索栏
   *
   * 为什么看起来像上下叠加？
   *  这是因为：
   *   外层 Container：用 decoration: LinearGradient(...) 画了一层黑色 → 透明的渐变背景。
   *   内层 Container：放在外层的 child 里（不是并列，而是嵌套）。它自己又有背景色和 SearchBar。
   *  所以，效果是：
   *  背景先由 外层渐变 Container 绘制。
   *  再在它上面叠加 内层 Container 的颜色。
   *  再在最上面放 SearchBar。
   *  这就是「上下叠加」的感觉。
   *  但它不是 Column 带来的，而是 父子 Container 的嵌套，导致视觉上分层
   */
  Widget get _appBar {
    //顶部有一层黑色渐变遮罩（方便白色文字在图片背景上看得清楚）
    return Column(
      children: [
        //顶部有一层黑色渐变遮罩（方便白色文字在图片背景上看得清楚）
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80,
            //背景颜色随着滚动（appBarAlpha）从透明渐变到白色
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            //中间放了一个带搜索框的 SearchBar，可以点击搜索或语音
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: "网红打卡地 景点 酒店 美食",
              leftButtonClick: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Container(
            //在底部增加了一条 分隔线阴影（仅在背景变成白色时出现
            height: appBarAlpha > 0.2 ? 0.5 : 0,
            decoration: const BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 1)]))
      ],
    );
  }

  //跳转到搜索页面
  void _jumpToSearch() {}

//跳转到语音页面
  void _jumpToSpeak() {}
}
