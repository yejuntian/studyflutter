import 'package:flutter/material.dart' hide SearchBar;
import 'package:studyflutter/dao/search_dao.dart';
import 'package:studyflutter/model/search_model.dart';
import 'package:studyflutter/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  String result = "";

  @override
  Widget build(BuildContext context) {
    // 保证 KeepAlive 生效
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(
                hideLeftButton: true,
                defaultText: "哈哈",
                hitText: "123",
                leftButtonClick: () {
                  Navigator.pop(context);
                },
                onChanged: _onTextChange,
                searchBarType: SearchBarType.normal),
            ElevatedButton(
                onPressed: () {
                  var fetch = SearchDao.fetch(
                      "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=%E9%95%BF%E5%9F%8E");
                  fetch.then((SearchModel model) {
                    setState(() {
                      result = model.data?[0].url ?? "";
                    });
                  });
                },
                child: const Text(
                  "get",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                )),
            Text(result),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onTextChange(String text) {}
}
