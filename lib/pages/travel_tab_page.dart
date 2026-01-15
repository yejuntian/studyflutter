import 'package:flutter/material.dart';
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
  List<TravelItem>? travelItems;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void _loadData() async {
    TravelDao.fetch(widget.travelUrl ?? _TRAVEL_URL,
            widget.groupChannelCode ?? "RX-OMF", pageIndex, pageSize)
        .then((travelItemModel) {
      setState(() {
        List<TravelItem> items = _filterItems(travelItemModel.resultList);
        if (items.isNotEmpty) {
          travelItems?.addAll(items);
        } else {
          travelItems = items;
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
