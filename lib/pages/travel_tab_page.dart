import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../dao/travel_dao.dart';
import '../model/travel_model.dart';

const _TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';

const pageSize = 10;
int pageIndex = 1;

/// 旅拍列表页面
class TravelTabPage extends StatefulWidget {
  final String? travelUrl;
  final String? groupChannelCode;

  const TravelTabPage(this.travelUrl, this.groupChannelCode, {super.key});

  @override
  State<TravelTabPage> createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage> {
  List<TravelItem> travelItems = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom(
        // 使用自定义网格视图，允许更灵活的布局控制
        gridDelegate: SliverWovenGridDelegate.count(
          // 设置交错网格委托，创建不规则但有序的网格布局
          crossAxisCount: 2, // 主轴方向（水平）显示2列
          // mainAxisSpacing: 2, // 主轴方向（垂直）间距为2像素
          // crossAxisSpacing: 2, // 交叉轴方向（水平）间距为2像素
          pattern: [
            // 定义网格图案模式，交替使用不同的网格单元格大小
            const WovenGridTile(1), // 第一种模式：占1个标准单元格大小
            const WovenGridTile(
              5 / 7, // 第二种模式：高度与宽度比例为5:7的矩形
              crossAxisRatio: 0.9, // 交叉轴（宽度）比例为0.9
              alignment: AlignmentDirectional.centerEnd, // 内容对齐方式为结束位置居中
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          // 创建子组件
          (context, index) => _TravelItem(
            index: index,
            travelItem: travelItems[index],
          ),
          childCount: travelItems.length,
        ),
      ),
    );
  }

  void _loadData() async {
    TravelDao.fetch(widget.travelUrl ?? _TRAVEL_URL,
            widget.groupChannelCode ?? "RX-OMF", pageIndex, pageSize)
        .then((travelItemModel) {
      setState(() {
        List<TravelItem> items = _filterItems(travelItemModel.resultList);
        if (items.isNotEmpty) {
          travelItems.addAll(items);
          print("travelItems count = ${travelItems.length}");
        }
      });
    }).catchError((e) {
      print(e);
    });
  }

  List<TravelItem> _filterItems(resultList) {
    if (resultList == null) {
      return [];
    }
    List<TravelItem> filterItems = [];
    resultList.forEach((item) {
      if (item.article != null) {
        //移除article为空的模型
        filterItems.add(item);
      }
    });
    return filterItems;
  }
}

//itemView子组件
class _TravelItem extends StatelessWidget {
  final int index;
  final TravelItem? travelItem;

  const _TravelItem({
    Key? key,
    required this.index,
    required this.travelItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        travelItem?.article?.articleTitle ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
