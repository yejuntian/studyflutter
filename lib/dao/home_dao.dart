import 'dart:convert';

import 'package:studyflutter/model/home_model.dart';
import 'package:http/http.dart' as http;

//首页大接口
const String HOME_URL =
    "https://www.geekailab.com/io/flutter_app/json/home_page.json";

class HomeDao {
  static Future<HomeModel> fetch() async {
    Uri uri = Uri.parse(HOME_URL);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      //解决中文乱码
      var result = json.decode(response.body);
      return HomeModel.fromJson2(result);
    } else {
      throw Exception("$HOME_URL 请求失败，状态码: ${response.statusCode}");
    }
  }
}
