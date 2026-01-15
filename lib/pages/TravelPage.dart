import 'package:flutter/material.dart';
import 'package:studyflutter/dao/travel_tab_dao.dart';
import 'package:studyflutter/model/travel_tab_model.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:studyflutter/pages/travel_tab_page.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  TabController? _tabController;
  List<TravelTab> tabs = [];
  TravelTabModel? travelTabModel;

  @override
  void initState() {
    super.initState();
    TravelTabDao.fetch().then((TravelTabModel model) {
      print('获取到的tabs数量: ${model.tabs?.length}');
      setState(() {
        tabs = model.tabs ?? [];
        travelTabModel = model;
        // 创建TabController，只创建一次
        _tabController = TabController(length: tabs.length, vsync: this);
      });
    }).catchError((e) {
      print('获取旅行标签数据失败: $e');
      setState(() {
        tabs = [];
        _tabController = TabController(length: 0, vsync: this);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 保证 KeepAlive 生效
    super.build(context);
    return Scaffold(
      body: tabs.isNotEmpty
          ? Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 30),
                  child: ButtonsTabBar(
                    tabs: tabs
                        .map((TravelTab tab) => Tab(text: tab.labelName ?? ''))
                        .toList(),
                    controller: _tabController,
                    backgroundColor: Colors.transparent,
                    unselectedBackgroundColor: Colors.transparent,
                    unselectedLabelStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                    labelStyle: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold), // 选中红色
                  ),
                ),
                //Flexible:在可用空间内“尽量占”，但可以被压缩（只在 Row / Column / Flex 中生效）
                // FlexFit.loose（默认，Flexible）
                // 最多占，不强制填满
                // 内容可以决定大小
                // 🔹 FlexFit.tight（等同 Expanded）
                Flexible(
                  fit: FlexFit.tight,
                  child: TabBarView(
                    controller: _tabController,
                    children: tabs.map((TravelTab tab) {
                      return TravelTabPage(
                        travelTabModel?.url ?? '',
                        tab.groupChannelCode ?? '',
                      );
                    }).toList(),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }
}
