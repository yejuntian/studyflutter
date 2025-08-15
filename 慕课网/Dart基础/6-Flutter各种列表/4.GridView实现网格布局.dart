import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewDemo());
}

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({super.key});

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
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
      title: "GridView实现网格布局",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GridView实现网格布局"),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: _buildGridViewItem(),
        ),
      ),
    );
  }

  List<Widget> _buildGridViewItem() {
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
}
