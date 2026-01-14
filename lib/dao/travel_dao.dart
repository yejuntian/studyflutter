import 'dart:convert';

import 'package:studyflutter/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:studyflutter/model/travel_tab_model.dart';

import '../model/travel_model.dart';

//旅拍页接口
var Params = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {'cid': "09031014111431397988"},
  "contentType": "json"
};

class TravelDao {
  static Future<TravelItemModel> fetch(
      String url, String groupChannelCode, int pageIndex, int pageSize) async {
    // 创建参数副本，避免直接修改全局变量
    Map<String, dynamic> params = Map.from(Params);
    // 设置分组频道代码
    params["groupChannelCode"] = groupChannelCode;
    // 获取页面参数并进行类型转换
    Map<String, dynamic> pagePara = Params["pagePara"] as Map<String, dynamic>;
    // 更新页面索引和页面大小
    pagePara["pageIndex"] = pageIndex;
    pagePara["pageSize"] = pageSize;
    Uri uri = Uri.parse(url);
    var response = await http.post(uri, body: json.encode(Params));
    if (response.statusCode == 200) {
      //解决中文乱码
      var result = json.decode(response.body);
      return TravelItemModel.fromJson(result);
    } else {
      throw Exception(" 请求失败，状态码: ${response.statusCode}");
    }
  }
}
