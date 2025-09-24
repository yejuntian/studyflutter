class SearchModel {
  List<SearchItem>? data;

  SearchModel({this.data});

  SearchModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    var list = json["data"] as List? ?? [];
    data = list.map((item) {
      return SearchItem.fromJson(item);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data?.map((e) {
            return e.toJson();
          }).toList() ??
          []
    };
  }
}

class SearchItem {
  String? code;
  String? word;
  String? type;
  String? districtname;
  String? url;
  bool? isBigIcon;

  SearchItem({
    this.code,
    this.word,
    this.type,
    this.districtname,
    this.url,
    this.isBigIcon,
  });

  SearchItem.fromJson(Map<String, dynamic>? json) {
    code = json?["code"] as String?;
    word = json?["word"] as String?;
    type = json?["type"] as String?;
    districtname = json?["districtname"] as String?;
    url = json?["url"] as String?;
    isBigIcon = json?["isBigIcon"] as bool?;
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "word": word,
      "type": type,
      "districtname": districtname,
      "url": url,
      "isBigIcon": isBigIcon
    };
  }
}
