import 'package:flutter/material.dart' hide SearchBar;
import 'package:studyflutter/dao/search_dao.dart';
import 'package:studyflutter/model/search_model.dart';
import 'package:studyflutter/pages/SpeakPage.dart';
import 'package:studyflutter/widget/search_bar.dart';
import 'package:studyflutter/widget/webview.dart';

const URL =
    'https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=';
const IMAGE_TYPES = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];

class SearchPage extends StatefulWidget {
  bool? hideLeftButton;
  String? searchUrl;
  String? searchKeyWord;
  String? hintText;

  SearchPage({
    super.key,
    this.hideLeftButton = true,
    this.searchUrl = URL,
    this.searchKeyWord,
    this.hintText,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  String? keyWord;
  SearchModel? searchModel;

  @override
  Widget build(BuildContext context) {
    // 保证 KeepAlive 生效
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: searchModel?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int pos) {
                    return _listViewItem(pos);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onTextChange(String text) {
    keyWord = text;
    if (text.isEmpty) {
      setState(() {
        searchModel = null;
      });
      return;
    }
    String url = "${widget.searchUrl}$text";
    SearchDao.fetch(url, text).then((SearchModel model) {
      //只有当，当前输入的内容和服务器返回的内容一致的时候才进行渲染。
      if (keyWord == model.keyWord) {
        setState(() {
          searchModel = model;
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  _appBar() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(int.parse("0x66000000")), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 8),
            height: 80, //搜索框高度80
            decoration: const BoxDecoration(color: Colors.white),
            child: SearchBar(
                hideLeftButton: widget.hideLeftButton,
                defaultText: widget.searchKeyWord,
                hitText: widget.hintText,
                leftButtonClick: () {
                  Navigator.pop(context);
                },
                speakClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpeakPage(),
                    ),
                  );
                },
                onChanged: _onTextChange,
                searchBarType: SearchBarType.normal),
          ),
        )
      ],
    );
  }

  _listViewItem(int pos) {
    if (searchModel == null || searchModel?.data == null) return null;
    SearchItem searchItem = searchModel!.data![pos];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Webview(
              url: searchItem.url,
              title: "详情",
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.3, color: Colors.grey),
          ),
        ),
        child: Row(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(1),
                child: Image(
                  width: 26,
                  height: 26,
                  image: AssetImage(_typeImage(searchItem)),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(searchItem),
                  _subTitle(searchItem),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _typeImage(SearchItem searchItem) {
    String type = searchItem.type ?? "";
    if (type.isEmpty) {
      return "images/type_travelgroup.png";
    }
    String path = "travelgroup";
    for (var val in IMAGE_TYPES) {
      if (type.contains(val)) {
        path = val;
        break;
      }
    }
    return "images/type_$path.png";
  }

  //itemView标题
  _title(SearchItem searchItem) {
    List<TextSpan> spans = [];
    spans.addAll(_keyWordTextSpans(searchItem.word, searchModel?.keyWord));
    spans.add(TextSpan(
        text: " ${searchItem.districtname ?? ""} ${searchItem.zonename ?? ""}",
        style: const TextStyle(fontSize: 16, color: Colors.grey)));
    return RichText(text: TextSpan(children: spans));
  }

  //itemView子标题
  _subTitle(SearchItem searchItem) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: searchItem.price ?? "",
            style: const TextStyle(fontSize: 16, color: Colors.orange),
          ),
          TextSpan(
            text: " ${searchItem.star ?? ""}",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Iterable<TextSpan> _keyWordTextSpans(String? word, String? keyWord) {
    List<TextSpan> spans = [];
    if (word == null || word.isEmpty || keyWord == null || keyWord.isEmpty) {
      return spans;
    }
    List<String> arr = word.split(keyWord);
    TextStyle normalStyle =
        const TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keyWordStyle =
        const TextStyle(fontSize: 16, color: Colors.orange);
    //'wordwoc'.split('w') -> [, ord, oc] @https://www.tutorialspoint.com/tpcg.php?p=wcpcUA
    for (var i = 0; i < arr.length; i++) {
      String value = arr[i];
      if (value.isNotEmpty) {
        spans.add(TextSpan(text: value, style: normalStyle));
      }
      if (i < arr.length - 1) {
        // 保证不是最后一个才加关键字
        spans.add(TextSpan(text: keyWord, style: keyWordStyle));
      }
    }
    return spans;
  }
}
