class TravelTabModel {
  String? url;
  List<TravelTab>? tabs;
  Map? param;

  TravelTabModel({this.url, this.tabs});

  TravelTabModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    url = json['url'] as String?;
    param = json['param'] as Map?;
    if (json['tabs'] != null) {
      tabs = [];
      json['tabs']?.forEach((i) {
        tabs!.add(TravelTab.fromJson(i));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    if (tabs != null) {
      data['tabs'] = tabs?.map((i) => i.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toJson2() {
    return {"url": url, "tabs": tabs?.map((i) => i.toJson()).toList()};
  }
}

class TravelTab {
  String? labelName;
  String? groupChannelCode;

  TravelTab({this.labelName, this.groupChannelCode});

  TravelTab.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    labelName = json['labelName'] as String?;
    groupChannelCode = json['groupChannelCode'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {"labelName": labelName, "groupChannelCode": groupChannelCode};
  }
}
