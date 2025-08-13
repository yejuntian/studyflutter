import 'dart:convert';

String data = '''
{
	"config": {
		"searchUrl": "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword="
	},
	"bannerList": [{
			"icon": "https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
			"url": "https://gs.ctrip.com/html5/you/travels/1422/3771516.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
		},
		{
			"icon": "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
			"url": "https://m.ctrip.com/webapp/vacations/tour/detail?productid=3168213&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
		},
		{
			"icon": "http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg",
			"url": "https://m.ctrip.com/events/jiudianshangchenghuodong.html?disable_webview_cache_key=1"
		},
		{
			"icon": "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg",
			"url": "https://m.ctrip.com/webapp/vacations/tour/detail?productid=53720&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
		}
	],
	"localNavList": [{
			"icon": "https://www.devio.org/io/flutter_app/img/ln_ticket.png",
			"title": "攻略·景点",
			"url": "https://m.ctrip.com/webapp/you/place/2.html?ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
			"statusBarColor": "1070b8",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/ln_weekend.png",
			"title": "周边游",
			"url": "https://m.ctrip.com/webapp/vacations/tour/around?&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
			"statusBarColor": "52149f",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/ln_food.png",
			"title": "美食林",
			"url": "https://m.ctrip.com/webapp/you/foods/address.html?new=1&ishideheader=true",
			"statusBarColor": "19A0F0",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/ln_oneday.png",
			"title": "一日游",
			"url": "https://dp.ctrip.com/webapp/activity/daytour",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/ln_guide.png",
			"title": "当地攻略",
			"url": "https://m.ctrip.com/webapp/you/",
			"statusBarColor": "19A0F0",
			"hideAppBar": true
		}
	],
	"gridNav": {
		"hotel": {
			"startColor": "fa5956",
			"endColor": "fa9b4d",
			"mainItem": {
				"title": "酒店",
				"icon": "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png",
				"url": "https://m.ctrip.com/webapp/hotel/",
				"statusBarColor": "4289ff"
			},
			"item1": {
				"title": "海外酒店",
				"url": "https://m.ctrip.com/webapp/hotel/oversea/?otype=1",
				"statusBarColor": "4289ff"
			},
			"item2": {
				"title": "特价酒店",
				"url": "https://m.ctrip.com/webapp/hotel/hotsale"
			},
			"item3": {
				"title": "团购",
				"url": "https://m.ctrip.com/webapp/tuan/?secondwakeup=true&dpclickjump=true",
				"hideAppBar": true
			},
			"item4": {
				"title": "民宿 客栈",
				"url": "https://m.ctrip.com/webapp/inn/index",
				"hideAppBar": true
			}
		},
		"flight": {
			"startColor": "4b8fed",
			"endColor": "53bced",
			"mainItem": {
				"title": "机票",
				"icon": "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-flight.png",
				"url": "https://m.ctrip.com/html5/flight/swift/index"
			},
			"item1": {
				"title": "火车票",
				"url": "https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=4e431539",
				"hideAppBar": true
			},
			"item2": {
				"title": "特价机票",
				"url": "https://m.ctrip.com/html5/flight/swift/index"
			},
			"item3": {
				"title": "汽车票·船票",
				"url": "https://m.ctrip.com/html5/Trains/bus/",
				"hideAppBar": true
			},
			"item4": {
				"title": "专车·租车",
				"url": "https://m.ctrip.com/webapp/car/index?s=ctrip&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
				"hideAppBar": true
			}
		},
		"travel": {
			"startColor": "34c2aa",
			"endColor": "6cd557",
			"mainItem": {
				"title": "旅游",
				"icon": "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-travel.png",
				"url": "https://m.ctrip.com/webapp/vacations/tour/vacations",
				"hideAppBar": true,
				"statusBarColor": "19A0F0"
			},
			"item1": {
				"title": "门票",
				"url": "https://m.ctrip.com/webapp/ticket/ticket",
				"statusBarColor": "19A0F0",
				"hideAppBar": true
			},
			"item2": {
				"title": "目的地攻略",
				"url": "https://m.ctrip.com/html5/you/",
				"statusBarColor": "19A0F0",
				"hideAppBar": true
			},
			"item3": {
				"title": "邮轮旅行",
				"url": "https://m.ctrip.com/webapp/cruise/index",
				"hideAppBar": true
			},
			"item4": {
				"title": "定制旅行",
				"url": "https://m.ctrip.com/webapp/dingzhi",
				"hideAppBar": true
			}
		}
	},
	"subNavList": [{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_wifi.png",
			"title": "WiFi电话卡",
			"url": "https://m.ctrip.com/webapp/activity/wifi",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_visa.png",
			"title": "保险·签证",
			"url": "https://m.ctrip.com/webapp/tourvisa/entry",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_exchange.png",
			"title": "外币兑换",
			"url": "https://dp.ctrip.com/webapp/forex/index?bid=2&1=1",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_shopping.png",
			"title": "购物",
			"url": "https://m.ctrip.com/webapp/gshop/?ctm_ref=M_ps_2home_sl&bid=2&cid=3&pid=1",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_guide.png",
			"title": "当地向导",
			"url": "https://m.ctrip.com/webapp/vacations/pguider/homepage?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_freetravel.png",
			"title": "自由行",
			"url": "https://dp.ctrip.com/webapp/vacations/idiytour/diyindex?navBarStyle=white",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_play.png",
			"title": "境外玩乐",
			"url": "https://dp.ctrip.com/webapp/activity/overseasindex",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_lipin.png",
			"title": "礼品卡",
			"url": "https://dp.ctrip.com/webapp/lipin/money",
			"hideAppBar": true
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_credit.png",
			"title": "信用卡",
			"url": "https://dp.ctrip.com/webapp/cc/index?bid=8&cid=1&pid=4"
		},
		{
			"icon": "https://www.devio.org/io/flutter_app/img/sub_nav_more.png",
			"title": "更多",
			"url": "https://dp.ctrip.com/webapp/more/",
			"hideAppBar": true
		}
	],
	"salesBox": {
		"icon": "https://www.devio.org/io/flutter_app/img/sales_box_huodong.png",
		"moreUrl": "https://contents.ctrip.com/activitysetupapp/mkt/index/moreact",
		"bigCard1": {
			"icon": "https://dimg04.c-ctrip.com/images/700t0y000000m71h523FE_375_260_342.png",
			"url": "https://contents.ctrip.com/buildingblocksweb/special/membershipcard/index.html?sceneid=1&productid=14912&ishidenavbar=yes&pushcode=act_svip_hm31",
			"title": "活动"
		},
		"bigCard2": {
			"icon": "https://dimg04.c-ctrip.com/images/700a10000000portu2BAD_375_260_342.jpg",
			"url": "https://m.ctrip.com/webapp/you/livestream/plan/crhHotelList.html?liveAwaken=true&isHideHeader=true&isHideNavBar=YES&mktcrhcode=hotevent",
			"title": "活动"
		},
		"smallCard1": {
			"icon": "https://dimg04.c-ctrip.com/images/700b0z000000neoth8688_375_160_345.jpg",
			"url": "https://contents.ctrip.com/activitysetupapp/mkt/index/nbaafs?pushcode=IP_nbaafs004",
			"title": "活动"
		},
		"smallCard2": {
			"icon": "https://dimg04.c-ctrip.com/images/700w0z000000mogkyEF78_375_160_345.jpg",
			"url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
			"title": "活动"
		},
		"smallCard3": {
			"icon": "https://dimg04.c-ctrip.com/images/700a0t000000im512AB2C_375_160_345.jpg",
			"url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
			"title": "活动"
		},
		"smallCard4": {
			"icon": "https://dimg04.c-ctrip.com/images/700d0s000000htvwo16C4_375_160_345.jpg",
			"url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
			"title": "活动"
		}
	}
}
''';

class Autogenerated {
  Config? config;
  List<BannerList>? bannerList;
  List<LocalNavList>? localNavList;
  GridNav? gridNav;
  List<SubNavList>? subNavList;
  SalesBox? salesBox;

  Autogenerated(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    if (json['bannerList'] != null) {
      bannerList = <BannerList>[];
      json['bannerList'].forEach((v) {
        bannerList!.add(new BannerList.fromJson(v));
      });
    }
    if (json['localNavList'] != null) {
      localNavList = <LocalNavList>[];
      json['localNavList'].forEach((v) {
        localNavList!.add(new LocalNavList.fromJson(v));
      });
    }
    gridNav =
        json['gridNav'] != null ? new GridNav.fromJson(json['gridNav']) : null;
    if (json['subNavList'] != null) {
      subNavList = <SubNavList>[];
      json['subNavList'].forEach((v) {
        subNavList!.add(new SubNavList.fromJson(v));
      });
    }
    salesBox = json['salesBox'] != null
        ? new SalesBox.fromJson(json['salesBox'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config!.toJson();
    }
    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList!.map((v) => v.toJson()).toList();
    }
    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList!.map((v) => v.toJson()).toList();
    }
    if (this.gridNav != null) {
      data['gridNav'] = this.gridNav!.toJson();
    }
    if (this.subNavList != null) {
      data['subNavList'] = this.subNavList!.map((v) => v.toJson()).toList();
    }
    if (this.salesBox != null) {
      data['salesBox'] = this.salesBox!.toJson();
    }
    return data;
  }
}

class Config {
  String? searchUrl;

  Config({this.searchUrl});

  Config.fromJson(Map<String, dynamic> json) {
    searchUrl = json['searchUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchUrl'] = this.searchUrl;
    return data;
  }
}

class BannerList {
  String? icon;
  String? url;

  BannerList({this.icon, this.url});

  BannerList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['url'] = this.url;
    return data;
  }
}

class LocalNavList {
  String? icon;
  String? title;
  String? url;
  String? statusBarColor;
  bool? hideAppBar;

  LocalNavList(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  LocalNavList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class GridNav {
  Hotel? hotel;
  Hotel? flight;
  Hotel? travel;

  GridNav({this.hotel, this.flight, this.travel});

  GridNav.fromJson(Map<String, dynamic> json) {
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    flight = json['flight'] != null ? new Hotel.fromJson(json['flight']) : null;
    travel = json['travel'] != null ? new Hotel.fromJson(json['travel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotel != null) {
      data['hotel'] = this.hotel!.toJson();
    }
    if (this.flight != null) {
      data['flight'] = this.flight!.toJson();
    }
    if (this.travel != null) {
      data['travel'] = this.travel!.toJson();
    }
    return data;
  }
}

class Hotel {
  String? startColor;
  String? endColor;
  LocalNavList? mainItem;
  Item3? item1;
  Item1? item2;
  Item3? item3;
  Item3? item4;

  Hotel(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  Hotel.fromJson(Map<String, dynamic> json) {
    startColor = json['startColor'];
    endColor = json['endColor'];
    mainItem = json['mainItem'] != null
        ? new LocalNavList.fromJson(json['mainItem'])
        : null;
    item1 = json['item1'] != null ? new Item3.fromJson(json['item1']) : null;
    item2 = json['item2'] != null ? new Item1.fromJson(json['item2']) : null;
    item3 = json['item3'] != null ? new Item3.fromJson(json['item3']) : null;
    item4 = json['item4'] != null ? new Item3.fromJson(json['item4']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;
    if (this.mainItem != null) {
      data['mainItem'] = this.mainItem!.toJson();
    }
    if (this.item1 != null) {
      data['item1'] = this.item1!.toJson();
    }
    if (this.item2 != null) {
      data['item2'] = this.item2!.toJson();
    }
    if (this.item3 != null) {
      data['item3'] = this.item3!.toJson();
    }
    if (this.item4 != null) {
      data['item4'] = this.item4!.toJson();
    }
    return data;
  }
}

class MainItem {
  String? title;
  String? icon;
  String? url;
  String? statusBarColor;

  MainItem({this.title, this.icon, this.url, this.statusBarColor});

  MainItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }
}

class Item1 {
  String? title;
  String? url;
  String? statusBarColor;

  Item1({this.title, this.url, this.statusBarColor});

  Item1.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    statusBarColor = json['statusBarColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['statusBarColor'] = this.statusBarColor;
    return data;
  }
}

class Item2 {
  String? title;
  String? url;

  Item2({this.title, this.url});

  Item2.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class Item3 {
  String? title;
  String? url;
  bool? hideAppBar;

  Item3({this.title, this.url, this.hideAppBar});

  Item3.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class SubNavList {
  String? icon;
  String? title;
  String? url;
  bool? hideAppBar;

  SubNavList({this.icon, this.title, this.url, this.hideAppBar});

  SubNavList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    url = json['url'];
    hideAppBar = json['hideAppBar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['url'] = this.url;
    data['hideAppBar'] = this.hideAppBar;
    return data;
  }
}

class SalesBox {
  String? icon;
  String? moreUrl;
  MainItem? bigCard1;
  MainItem? bigCard2;
  MainItem? smallCard1;
  MainItem? smallCard2;
  MainItem? smallCard3;
  MainItem? smallCard4;

  SalesBox(
      {this.icon,
      this.moreUrl,
      this.bigCard1,
      this.bigCard2,
      this.smallCard1,
      this.smallCard2,
      this.smallCard3,
      this.smallCard4});

  SalesBox.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    moreUrl = json['moreUrl'];
    bigCard1 = json['bigCard1'] != null
        ? new MainItem.fromJson(json['bigCard1'])
        : null;
    bigCard2 = json['bigCard2'] != null
        ? new MainItem.fromJson(json['bigCard2'])
        : null;
    smallCard1 = json['smallCard1'] != null
        ? new MainItem.fromJson(json['smallCard1'])
        : null;
    smallCard2 = json['smallCard2'] != null
        ? new MainItem.fromJson(json['smallCard2'])
        : null;
    smallCard3 = json['smallCard3'] != null
        ? new MainItem.fromJson(json['smallCard3'])
        : null;
    smallCard4 = json['smallCard4'] != null
        ? new MainItem.fromJson(json['smallCard4'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;
    if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1!.toJson();
    }
    if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2!.toJson();
    }
    if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1!.toJson();
    }
    if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2!.toJson();
    }
    if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3!.toJson();
    }
    if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4!.toJson();
    }
    return data;
  }
}

void main() {
  Map<String, dynamic> jsonMap = json.decode(data);
  Autogenerated autogenerated = Autogenerated.fromJson(jsonMap);
  print(autogenerated.toJson());
}
