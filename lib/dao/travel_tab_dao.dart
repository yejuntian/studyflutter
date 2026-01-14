import 'dart:convert';

import 'package:studyflutter/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'package:studyflutter/model/travel_tab_model.dart';

//旅拍类别接口
const String Travel_Tab_URL =
    "http://www.devio.org/io/flutter_app/json/travel_page.json";

class TravelTabDao {
  static Future<TravelTabModel> fetch() async {
    Uri uri = Uri.parse(Travel_Tab_URL);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      //解决中文乱码
      var result = json.decode(response.body);
      return TravelTabModel.fromJson(result);
    } else {
      throw Exception("$Travel_Tab_URL 请求失败，状态码: ${response.statusCode}");
    }
  }
}
