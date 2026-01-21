import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:studyflutter/widget/loading_container.dart';
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

//实现AutomaticKeepAliveClientMixin自动保持页面状态
class _TravelTabPageState extends State<TravelTabPage>
    with AutomaticKeepAliveClientMixin {
  List<TravelItem> travelItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: isLoading,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          //MasonryGridView.count:容器高度根据组件大小而定（自适应高度瀑布流（不会裁）
          //SliverWovenGridDelegate.count:固定高度网格（会裁内容）
          child: MasonryGridView.count(
            // 使用瀑布流网格视图展示旅拍项目
            crossAxisCount: 2,
            // 每行显示2列
            mainAxisSpacing: 6,
            // 主轴方向间距为6
            crossAxisSpacing: 6,
            // 交叉轴方向间距为6
            itemCount: travelItems.length,
            // 项目总数
            itemBuilder: (context, index) {
              // 构建每个网格项
              return _TravelItem(
                index: index,
                travelItem: travelItems[index],
              );
            },
          ),
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
          isLoading = false;
          print("travelItems count = ${travelItems.length}");
        }
      });
    }).catchError((e) {
      isLoading = false;
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

  @override
  // 防止页面被回收（防止页面重新绘制）
  bool get wantKeepAlive => true;
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
            // 主轴方向（垂直方向）从顶部开始对齐子组件
            mainAxisAlignment: MainAxisAlignment.start,
            // 交叉轴方向（水平方向）拉伸子组件以填满整个宽度
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _itemImage(context),
              Container(
                padding: const EdgeInsets.all(4),
                child: Text(
                  travelItem?.article?.articleTitle ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              _infoText(),
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

//显示底部左右布局的text文本
  _infoText() {
    return Container(
      padding: const EdgeInsets.only(left: 6, top: 0, right: 6, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 左边的作者头像和昵称 作者信息
          Row(
            children: [
              PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  travelItem?.article?.author?.coverImage?.dynamicUrl ?? "",
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: 90,
                child: Text(
                  travelItem?.article?.author?.nickName ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          // 右边的点赞数和评论数
          Row(
            children: [
              // 点赞数
              const Icon(
                Icons.thumb_up,
                size: 14,
                color: Colors.grey,
              ),
              // 评论数
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  (travelItem?.article?.likeCount ?? 0).toString(),
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
