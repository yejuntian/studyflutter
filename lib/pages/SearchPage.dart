import 'package:flutter/material.dart' hide SearchBar;
import 'package:studyflutter/dao/search_dao.dart';
import 'package:studyflutter/model/search_model.dart';
import 'package:studyflutter/widget/search_bar.dart';
import 'package:studyflutter/widget/webview.dart';

const URL =
    'https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=';

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
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${searchItem.word ?? ""}${searchItem.districtname ?? ""}${searchItem.zonename ?? ""}"),
                  Text("${searchItem.price ?? ""}${searchItem.type ?? ""}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
