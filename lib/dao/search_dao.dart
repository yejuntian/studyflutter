import 'dart:convert';

import 'package:studyflutter/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:studyflutter/model/search_model.dart';

///搜索接口
class SearchDao {
  //https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=%E9%95%BF%E5%9F%8E
  static Future<SearchModel> fetch(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      //解决中文乱码
      var result = json.decode(response.body);
      return SearchModel.fromJson(result);
    } else {
      throw Exception("搜索接口 请求失败，状态码: ${response.statusCode}");
    }
  }
}
