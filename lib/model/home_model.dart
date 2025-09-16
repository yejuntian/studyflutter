import 'package:studyflutter/model/common_model.dart';
import 'package:studyflutter/model/config_model.dart';
import 'package:studyflutter/model/grid_nav_model.dart';
import 'package:studyflutter/model/sales_box_model.dart';

class HomeModel {
  ConfigModel? config;
  List<CommonModel>? bannerList;
  List<CommonModel>? localNavList;
  GridNavModel? gridNav;
  List<CommonModel>? subNavList;
  SalesBoxModel? salesBox;

  HomeModel({
    this.config,
    this.bannerList,
    this.localNavList,
    this.gridNav,
    this.subNavList,
    this.salesBox,
  });

  //第一种写法
  HomeModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    config =
        json["config"] != null ? ConfigModel.fromJson(json["config"]) : null;
    if (json["bannerList"] != null) {
      bannerList = <CommonModel>[];
      for (var json in json["bannerList"]) {
        bannerList?.add(CommonModel.fromJson(json));
      }
      if (json["localNavList"] != null) {
        localNavList = <CommonModel>[];
        for (var json in json["localNavList"]) {
          localNavList?.add(CommonModel.fromJson(json));
        }
      }
      gridNav = json["gridNav"] != null
          ? GridNavModel.fromJson(json["gridNav"])
          : null;
      if (json["localNavList"] != null) {
        localNavList = <CommonModel>[];
        for (var json in json["localNavList"]) {
          localNavList?.add(CommonModel.fromJson(json));
        }
      }
      if (json["subNavList"] != null) {
        subNavList = <CommonModel>[];
        for (var json in json["subNavList"]) {
          subNavList?.add(CommonModel.fromJson(json));
        }
      }
      salesBox = json["salesBox"] != null
          ? SalesBoxModel.fromJson(json["salesBox"])
          : null;
    }
  }

  //第二种写法
  factory HomeModel.fromJson2(Map<String, dynamic>? json) {
    if (json == null) return HomeModel();
    return HomeModel(
      config:
          json["config"] != null ? ConfigModel.fromJson(json["config"]) : null,
      bannerList: ((json["bannerList"] as List?)
          ?.map((obj) => CommonModel.fromJson(obj))
          .toList()),
      localNavList: ((json["localNavList"] as List?)
          ?.map((obj) => CommonModel.fromJson(obj))
          .toList()),
      gridNav: json["gridNav"] != null
          ? GridNavModel.fromJson(json["gridNav"])
          : null,
      subNavList: ((json["subNavList"] as List?)
          ?.map((obj) => CommonModel.fromJson(obj))
          .toList()),
      salesBox: json["salesBox"] != null
          ? SalesBoxModel.fromJson(json["salesBox"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "config": config?.toJson(),
      "bannerList": bannerList?.map((obj) {
        return obj.toJson();
      }).toList(),
      "localNavList": localNavList?.map((obj) {
        return obj.toJson();
      }).toList(),
      "gridNav": gridNav?.toJson(),
      "subNavList": subNavList?.map((obj) {
        return obj.toJson();
      }).toList(),
      "salesBox": salesBox?.toJson(),
    };
  }
}
