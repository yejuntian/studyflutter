import 'package:flutter/material.dart';

import '../pages/HomePage.dart';
import '../pages/MyPage.dart';
import '../pages/SearchPage.dart';
import '../pages/TravelPage.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  var _currentIndex = 0;

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: PageView(
        onPageChanged: (pageIndex) {
          setState(() {
            _currentIndex = pageIndex;
          });
        },
        controller: _controller,
        //禁止滑动
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomePage(),
          SearchPage(),
          const TravelPage(),
          const MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentPage) {
          _controller.jumpToPage(currentPage);
          setState(() {
            _currentIndex = currentPage;
          });
        },
        currentIndex: _currentIndex,
        //显示选中标题
        showSelectedLabels: true,
        //显示未选中标题
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: _activeColor,
        unselectedItemColor: _defaultColor,
        items: [
          _bottomItem('首页', Icons.home),
          _bottomItem('搜索', Icons.search),
          _bottomItem('旅拍', Icons.camera_alt),
          _bottomItem('我的', Icons.account_circle),
        ],
      ),
    );
  }

  _bottomItem(String title, IconData icon) {
    return BottomNavigationBarItem(
      label: title,
      icon: Icon(
        icon,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: _activeColor,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
