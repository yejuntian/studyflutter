import 'package:flutter/material.dart';
import 'package:studyflutter/widget/webview.dart';
import '../model/common_model.dart';
//活动入口˚
class SubNav extends StatelessWidget {
  final List<CommonModel>? subNavList;

  const SubNav({super.key, this.subNavList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> list = subNavList!.map((CommonModel commonModel) {
      return _item(context, commonModel);
    }).toList();
    //计算每行显示的个数
    int rowCountSize = (list.length / 2 + 0.5).toInt();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: list.sublist(0, rowCountSize),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: list.sublist(rowCountSize, list.length),
          ),
        ),
      ],
    );
  }

  //构建item
  Widget _item(BuildContext context, CommonModel commonModel) {
    return Expanded(
      //Expanded flex: 1 这样每个item进行平分，上下对其显示。
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Webview(
              url: commonModel.url,
              statusBarColor: commonModel.statusBarColor,
              title: commonModel.title,
              hideAppBar: commonModel.hideAppBar,
            );
          }));
        },
        child: Column(
          children: [
            Image.network(
              commonModel.icon ?? "",
              width: 16,
              height: 16,
            ),
            Text(
              commonModel.title ?? "",
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
