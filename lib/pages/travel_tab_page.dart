import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:studyflutter/widget/webview.dart';

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
          mainAxisSpacing: 4, // 主轴方向（垂直）间距为4像素，增加间距让布局更美观
          crossAxisSpacing: 4, // 交叉轴方向（水平）间距为4像素，增加间距让布局更美观
          pattern: [
            // 定义网格图案模式，交替使用不同的网格单元格大小
            const WovenGridTile(1), // 第一种模式：占1个标准单元格大小
            const WovenGridTile(
              1,
              crossAxisRatio: 0.9, // 交叉轴（宽度）比例为0.9,
              alignment: AlignmentDirectional.center,
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
    return GestureDetector(
      onTap: () {
        if (travelItem?.article != null &&
            travelItem!.article!.urls != null &&
            travelItem!.article!.urls!.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Webview(
                title: "详情",
                url: travelItem!.article!.urls![0].h5Url,
              ),
            ),
          );
        }
      },
      child: Card(
        child: PhysicalModel(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          color: Colors.transparent,
          child: Column(
            children: [
              _itemImage(context),
            ],
          ),
        ),
      ),
    );
  }

  _itemImage(BuildContext context) {
    return Stack(children: [
      Image.network(
        travelItem?.article?.images?[0].dynamicUrl ?? "",
        width: MediaQuery.of(context).size.width,
        height: 200,
        fit: BoxFit.cover,
      ),
      Positioned(
        left: 8,
        bottom: 8,
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white54, width: 1),
            borderRadius: BorderRadius.circular(10),
            color: Colors.black54,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 12,
                ),
              ),
              LimitedBox(
                maxWidth: 130,
                child: Text(
                  _getLocation(travelItem),
                  maxLines: 1, //最多显示一行
                  // 超出显示省略号
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }

  //获取位置信息
  String _getLocation(TravelItem? travelItem) {
    if (travelItem?.article?.pois == null ||
        travelItem!.article!.pois!.isEmpty) {
      return "未知";
    }
    return travelItem.article?.pois?[0].poiName ?? "未知";
  }
}
