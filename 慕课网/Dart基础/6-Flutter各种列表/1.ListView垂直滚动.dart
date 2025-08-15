import 'package:flutter/material.dart';

void main() {
  runApp(const VerticalList());
}

class VerticalList extends StatefulWidget {
  const VerticalList({super.key});

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
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
      title: "实现垂直滚动List",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("实现垂直滚动List"),
        ),
        body: ListView(
          children: _buildListItem(),
        ),
      ),
    );
  }

  List<Widget> _buildListItem() {
    return cities.map((city) => _buildItem(city)).toList();
  }

  Widget _buildItem(String city) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
