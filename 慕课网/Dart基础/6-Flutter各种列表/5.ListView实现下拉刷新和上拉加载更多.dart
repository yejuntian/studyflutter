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
    "长沙",
    "郑州",
    "宁波",
    "厦门",
    "福州",
    "大连",
    "济南",
    "合肥",
    "昆明",
    "南昌",
    "石家庄",
    "太原",
    "呼和浩特",
    "兰州",
    "贵阳",
    "海口",
    "乌鲁木齐",
    "长春",
    "哈尔滨",
    "南宁",
    "拉萨",
    "银川",
    "香港"
  ];

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
}
