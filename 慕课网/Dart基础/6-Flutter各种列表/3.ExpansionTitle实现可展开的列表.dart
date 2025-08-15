import 'package:flutter/material.dart';

void main() {
  runApp(const Expand_collapseList());
}

class Expand_collapseList extends StatefulWidget {
  const Expand_collapseList({super.key});

  @override
  State<Expand_collapseList> createState() => _Expand_collapseListState();
}

class _Expand_collapseListState extends State<Expand_collapseList> {
  Map<String, List<String>> cityMap = {
    "北京市": ["密云区", "怀柔区", "延庆区", "平谷区", "昌平区", "顺义区"],
    "上海市": ["崇明区", "浦东新区", "金山区", "奉贤区", "宝山区"],
    "广州市": ["增城区", "从化区", "花都区", "番禺区", "南沙区", "白云区"],
    "深圳市": ["龙华区", "龙岗区", "坪山区", "光明区", "盐田区", "宝安区"],
    "杭州市": ["富阳区", "临安区", "桐庐县", "淳安县", "余杭区", "萧山区"],
    "成都市": ["都江堰市", "彭州市", "邛崃市", "崇州市", "简阳市", "新津区"],
    "重庆市": ["万州区", "涪陵区", "江津区", "合川区", "永川区", "綦江区"],
    "武汉市": ["江夏区", "黄陂区", "新洲区", "蔡甸区", "东西湖区", "汉南区"],
    "南京市": ["溧水区", "高淳区", "江宁区", "浦口区", "六合区"],
    "西安市": ["蓝田县", "周至县", "鄠邑区", "高陵区", "长安区", "临潼区"]
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "实现列表的展开和收起",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("实现列表的展开和收起"),
        ),
        body: ListView(
          children: _buildListItem(),
        ),
      ),
    );
  }

  List<Widget> _buildListItem() {
    return cityMap.keys.map((city) {
      return ExpansionTile(
        title: Text(
          city,
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
        children: _buildSubCity(city, cityMap[city]!),
      );
    }).toList();
  }

  List<Widget> _buildSubCity(String city, List<String> cityMap) {
    return cityMap.map((subCity) {
      return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          height: 50,
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            subCity,
            style: const TextStyle(fontSize: 20, color: Colors.amberAccent),
          ),
        ),
      );
    }).toList();
  }
}
