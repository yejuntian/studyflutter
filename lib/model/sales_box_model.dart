//活动入口模型
import 'package:studyflutter/model/common_model.dart';

class SalesBoxModel {
  String? icon;
  String? moreUrl;
  CommonModel? bigCard1;
  CommonModel? bigCard2;
  CommonModel? smallCard1;
  CommonModel? smallCard2;
  CommonModel? smallCard3;
  CommonModel? smallCard4;

  SalesBoxModel({
    this.icon,
    this.moreUrl,
    this.bigCard1,
    this.bigCard2,
    this.smallCard1,
    this.smallCard2,
    this.smallCard3,
    this.smallCard4,
  });

  SalesBoxModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    icon == json["icon"] as String?;
    moreUrl == json["moreUrl"] as String?;
    bigCard1 = json["bigCard1"] != null
        ? CommonModel.fromJson(json["bigCard1"])
        : null;
    bigCard2 = json["bigCard2"] != null
        ? CommonModel.fromJson(json["bigCard2"])
        : null;
    smallCard1 = json["smallCard1"] != null
        ? CommonModel.fromJson(json["smallCard1"])
        : null;
    smallCard2 = json["smallCard2"] != null
        ? CommonModel.fromJson(json["smallCard2"])
        : null;
    smallCard3 = json["smallCard3"] != null
        ? CommonModel.fromJson(json["smallCard3"])
        : null;
    smallCard4 = json["smallCard4"] != null
        ? CommonModel.fromJson(json["smallCard4"])
        : null;
  }
}
