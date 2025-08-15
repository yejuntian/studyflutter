import 'package:flutter/material.dart';

void main() {
  runApp(const ListViewHandleScroll());
}

class ListViewHandleScroll extends StatefulWidget {
  const ListViewHandleScroll({super.key});

  @override
  State<ListViewHandleScroll> createState() => _ListViewHandleScrollState();
}

class _ListViewHandleScrollState extends State<ListViewHandleScroll> {
  List<String> cities = [
    "北京",
    "上海",
    "广州",
    "深圳",
    "杭州",
    "成都",
    "重庆",
    "武汉",
    "西安",
    "南京",
    "天津",
    "苏州",
    "青岛",
    "长沙"
  ];

/*
  1. NotificationListener
  定位：一个 Widget，用来监听 Notification（通知）事件，包括滚动通知（ScrollNotification）。
  事件获取方式：基于 Widget 树事件冒泡（父 Widget 拦截子 Widget 发出的通知）。

  优点：
    不需要直接操作滚动控件
    可以监听整个 Widget 树中任意子节点的通知

  缺点：
    只能监听通知类型的事件
    滚动信息是 被动获取（依赖事件触发）

  常见用途：
    监听页面滚动开始、进行中、结束
    监听页面渲染完成


  2. ScrollController
  定位：一个 控制器对象，直接管理和控制可滚动组件（ListView、SingleChildScrollView 等）。
  事件获取方式：通过 监听控制器的监听器（addListener()）。

  优点：
    可以 主动控制 滚动（例如调用 jumpTo()、animateTo()）
    获取滚动位置更加精准（controller.offset）

  缺点：
    必须和可滚动组件绑定
    只能监听绑定的那个控件

  常见用途：
    精确获取滚动位置
    主动滚动到指定位置
    监听页面是否滚动到顶部/底部
*/

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //下滑到最底部
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List实现下拉刷新和上拉加载更多功能",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List实现下拉刷新和上拉加载更多功能"),
        ),
        body: RefreshIndicator(
            onRefresh: handleOnRefresh,
            child: ListView(
              controller: scrollController,
              children: _buildListViewItem(),
            )),
      ),
    );
  }

  List<Widget> _buildListViewItem() {
    return cities.map((city) {
      return _buildItem(city);
    }).toList();
  }

  Widget _buildItem(String city) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 1, bottom: 2, right: 1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Text(
        city,
        style: const TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }

  Future<void> handleOnRefresh() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        cities = cities.reversed.toList();
      });
    });
  }

  //加载更多数据
  void _loadMoreData() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        //复制cities的所有数据到list集合中
        List<String> list = List<String>.from(cities);
        list.addAll(cities);
        cities = list;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
