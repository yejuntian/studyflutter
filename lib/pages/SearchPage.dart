import 'package:flutter/material.dart' hide SearchBar;
import 'package:studyflutter/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
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
                searchBarType: SearchBarType.normal)
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onTextChange(String text) {}
}
