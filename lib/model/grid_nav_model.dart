import 'package:studyflutter/model/common_model.dart';

//首页网格卡片模型
class GridNavModel {
  GridNavItem? hotel;
  GridNavItem? flight;
  GridNavItem? travel;

  GridNavModel({
    this.hotel,
    this.flight,
    this.travel,
  });

  GridNavModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    hotel = json["hotel"] != null ? GridNavItem.fromJson(json["hotel"]) : null;
    flight =
        json["flight"] != null ? GridNavItem.fromJson(json["flight"]) : null;
    travel =
        json["travel"] != null ? GridNavItem.fromJson(json["travel"]) : null;
  }
}

class GridNavItem {
  String? startColor;
  String? endColor;
  CommonModel? mainItem;
  CommonModel? item1;
  CommonModel? item2;
  CommonModel? item3;
  CommonModel? item4;

  GridNavItem({
    this.startColor,
    this.endColor,
    this.mainItem,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  });

  GridNavItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    startColor = json["startColor"] as String?;
    endColor = json["endColor"] as String?;
    mainItem = json["mainItem"] != null
        ? CommonModel.fromJson(json["mainItem"])
        : null;
    item1 = json["item1"] != null ? CommonModel.fromJson(json["item1"]) : null;
    item2 = json["item2"] != null ? CommonModel.fromJson(json["item2"]) : null;
    item3 = json["item3"] != null ? CommonModel.fromJson(json["item3"]) : null;
    item4 = json["item4"] != null ? CommonModel.fromJson(json["item4"]) : null;
  }
}
