///旅拍页模型
class TravelItemModel {
  int? totalCount;
  List<TravelItem>? resultList;

  TravelItemModel({totalCount, resultList});

  TravelItemModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    totalCount = json['totalCount'];
    if (json['resultList'] != null) {
      resultList = [];
      json['resultList'].forEach((v) {
        resultList!.add(TravelItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    if (resultList != null) {
      data['resultList'] = resultList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TravelItem {
  int? type;
  Article? article;

  TravelItem({type, article});

  TravelItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    type = json['type'];
    article =
        json['article'] != null ? Article.fromJson(json['article']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    if (article != null) {
      data['article'] = article!.toJson();
    }
    return data;
  }
}

class Article {
  int? articleId;
  String? articleType;
  int? productType;
  int? sourceType;
  String? articleTitle;
  Author? author;
  List<Images>? images;
  bool? hasVideo;
  int? readCount;
  int? likeCount;
  int? commentCount;
  List<Urls>? urls;
  List<Null>? tags;
  List<Topics>? topics;
  List<Pois>? pois;
  String? publishTime;
  String? publishTimeDisplay;
  String? shootTime;
  String? shootTimeDisplay;
  int? level;
  String? distanceText;
  bool? isLike;
  int? imageCounts;
  bool? isCollected;
  int? collectCount;
  int? articleStatus;
  String? poiName;

  Article(
      {articleId,
      articleType,
      productType,
      sourceType,
      articleTitle,
      author,
      images,
      hasVideo,
      readCount,
      likeCount,
      commentCount,
      urls,
      tags,
      topics,
      pois,
      publishTime,
      publishTimeDisplay,
      shootTime,
      shootTimeDisplay,
      level,
      distanceText,
      isLike,
      imageCounts,
      isCollected,
      collectCount,
      articleStatus,
      poiName});

  Article.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    articleId = json['articleId'];
    articleType = json['articleType'];
    productType = json['productType'];
    sourceType = json['sourceType'];
    articleTitle = json['articleTitle'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    hasVideo = json['hasVideo'];
    readCount = json['readCount'];
    likeCount = json['likeCount'];
    commentCount = json['commentCount'];
    if (json['urls'] != null) {
      urls = [];
      json['urls'].forEach((v) {
        urls!.add(Urls.fromJson(v));
      });
    }
    if (json['topics'] != null) {
      topics = [];
      json['topics'].forEach((v) {
        topics!.add(Topics.fromJson(v));
      });
    }
    if (json['pois'] != null) {
      pois = [];
      json['pois'].forEach((v) {
        pois!.add(Pois.fromJson(v));
      });
    }
    publishTime = json['publishTime'];
    publishTimeDisplay = json['publishTimeDisplay'];
    shootTime = json['shootTime'];
    shootTimeDisplay = json['shootTimeDisplay'];
    level = json['level'];
    distanceText = json['distanceText'];
    isLike = json['isLike'];
    imageCounts = json['imageCounts'];
    isCollected = json['isCollected'];
    collectCount = json['collectCount'];
    articleStatus = json['articleStatus'];
    poiName = json['poiName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['articleId'] = articleId;
    data['articleType'] = articleType;
    data['productType'] = productType;
    data['sourceType'] = sourceType;
    data['articleTitle'] = articleTitle;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['hasVideo'] = hasVideo;
    data['readCount'] = readCount;
    data['likeCount'] = likeCount;
    data['commentCount'] = commentCount;
    if (urls != null) {
      data['urls'] = urls!.map((v) => v.toJson()).toList();
    }
    if (topics != null) {
      data['topics'] = topics!.map((v) => v.toJson()).toList();
    }
    if (pois != null) {
      data['pois'] = pois!.map((v) => v.toJson()).toList();
    }
    data['publishTime'] = publishTime;
    data['publishTimeDisplay'] = publishTimeDisplay;
    data['shootTime'] = shootTime;
    data['shootTimeDisplay'] = shootTimeDisplay;
    data['level'] = level;
    data['distanceText'] = distanceText;
    data['isLike'] = isLike;
    data['imageCounts'] = imageCounts;
    data['isCollected'] = isCollected;
    data['collectCount'] = collectCount;
    data['articleStatus'] = articleStatus;
    data['poiName'] = poiName;
    return data;
  }
}

class Author {
  int? authorId;
  String? nickName;
  String? clientAuth;
  String? jumpUrl;
  CoverImage? coverImage;
  int? identityType;
  String? tag;

  Author(
      {authorId, nickName, clientAuth, jumpUrl, coverImage, identityType, tag});

  Author.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    authorId = json['authorId'] as int? ?? 0;
    nickName = json['nickName'] as String? ?? '';
    clientAuth = json['clientAuth'] as String? ?? '';
    jumpUrl = json['jumpUrl'] as String? ?? '';
    coverImage = json['coverImage'] != null
        ? CoverImage.fromJson(json['coverImage'])
        : null;
    identityType = json['identityType'] as int? ?? 0;
    tag = json['tag'] as String? ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['authorId'] = authorId;
    data['nickName'] = nickName;
    data['clientAuth'] = clientAuth;
    data['jumpUrl'] = jumpUrl;
    if (coverImage != null) {
      data['coverImage'] = coverImage!.toJson();
    }
    data['identityType'] = identityType;
    data['tag'] = tag;
    return data;
  }
}

class CoverImage {
  String? dynamicUrl;
  String? originalUrl;

  CoverImage({dynamicUrl, originalUrl});

  CoverImage.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    dynamicUrl = json['dynamicUrl'];
    originalUrl = json['originalUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['dynamicUrl'] = dynamicUrl;
    data['originalUrl'] = originalUrl;
    return data;
  }
}

class Images {
  int? imageId;
  String? dynamicUrl;
  String? originalUrl;
  double? width;
  double? height;
  int? mediaType;
  bool? isWaterMarked;

  Images(
      {imageId,
      dynamicUrl,
      originalUrl,
      width,
      height,
      mediaType,
      isWaterMarked});

  Images.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    imageId = json['imageId'];
    dynamicUrl = json['dynamicUrl'];
    originalUrl = json['originalUrl'];
    width = json['width'];
    height = json['height'];
    mediaType = json['mediaType'];
    isWaterMarked = json['isWaterMarked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imageId'] = imageId;
    data['dynamicUrl'] = dynamicUrl;
    data['originalUrl'] = originalUrl;
    data['width'] = width;
    data['height'] = height;
    data['mediaType'] = mediaType;
    data['isWaterMarked'] = isWaterMarked;
    return data;
  }
}

class Urls {
  String? version;
  String? appUrl;
  String? h5Url;
  String? wxUrl;

  Urls({version, appUrl, h5Url, wxUrl});

  Urls.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    appUrl = json['appUrl'];
    h5Url = json['h5Url'];
    wxUrl = json['wxUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['version'] = version;
    data['appUrl'] = appUrl;
    data['h5Url'] = h5Url;
    data['wxUrl'] = wxUrl;
    return data;
  }
}

class Topics {
  int? topicId;
  String? topicName;
  int? level;

  Topics({topicId, topicName, level});

  Topics.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    topicId = json['topicId'];
    topicName = json['topicName'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['topicId'] = topicId;
    data['topicName'] = topicName;
    data['level'] = level;
    return data;
  }
}

class Pois {
  int? poiType;
  int? poiId;
  String? poiName;
  int? businessId;
  int? districtId;
  PoiExt? poiExt;
  int? source;
  int? isMain;
  bool? isInChina;
  String? countryName;

  Pois(
      {poiType,
      poiId,
      poiName,
      businessId,
      districtId,
      poiExt,
      source,
      isMain,
      isInChina,
      countryName});

  Pois.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    poiType = json['poiType'];
    poiId = json['poiId'];
    poiName = json['poiName'];
    businessId = json['businessId'];
    districtId = json['districtId'];
    poiExt = json['poiExt'] != null ? PoiExt.fromJson(json['poiExt']) : null;
    source = json['source'];
    isMain = json['isMain'];
    isInChina = json['isInChina'];
    countryName = json['countryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['poiType'] = poiType;
    data['poiId'] = poiId;
    data['poiName'] = poiName;
    data['businessId'] = businessId;
    data['districtId'] = districtId;
    if (poiExt != null) {
      data['poiExt'] = poiExt!.toJson();
    }
    data['source'] = source;
    data['isMain'] = isMain;
    data['isInChina'] = isInChina;
    data['countryName'] = countryName;
    return data;
  }
}

class PoiExt {
  String? h5Url;
  String? appUrl;

  PoiExt({h5Url, appUrl});

  PoiExt.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    h5Url = json['h5Url'];
    appUrl = json['appUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['h5Url'] = h5Url;
    data['appUrl'] = appUrl;
    return data;
  }
}
