class CommonModel {
  String? icon;
  String? title;
  String? url;
  String? statusBarColor;
  bool? hideAppBar;

  CommonModel({
    this.icon,
    this.title,
    this.url,
    this.statusBarColor,
    this.hideAppBar,
  });

  CommonModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    icon = json["icon"] as String?;
    title = json["title"] as String?;
    url = json["url"] as String?;
    statusBarColor = json["statusBarColor"] as String?;
    hideAppBar = json["hideAppBar"] as bool?;
  }

  Map<String, dynamic> toJson() {
    return {
      "icon": icon,
      "title": title,
      "url": url,
      "statusBarColor": statusBarColor,
      "hideAppBar": hideAppBar
    };
  }
}
