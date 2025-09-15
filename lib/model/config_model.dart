class ConfigModel {
  String? searchUrl;

  ConfigModel({this.searchUrl});

  ConfigModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    searchUrl = json[""] as String?;
  }
}
