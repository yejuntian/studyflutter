class ConfigModel {
  String? searchUrl;

  ConfigModel({this.searchUrl});

  ConfigModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    searchUrl = json["searchUrl"] as String?;
  }

  Map<String, dynamic> toJson() {
    return {"searchUrl": searchUrl};
  }
}
