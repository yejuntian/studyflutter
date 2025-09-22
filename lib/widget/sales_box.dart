import 'package:flutter/material.dart';
import 'package:studyflutter/model/common_model.dart';
import 'package:studyflutter/model/sales_box_model.dart';
import 'package:studyflutter/widget/webview.dart';

import '../util/navigator_util.dart';

///底部卡片入口
class SalesBox extends StatelessWidget {
  SalesBoxModel? salesBox;

  SalesBox({super.key, this.salesBox});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: _items(context),
    );
  }

  _items(BuildContext context) {
    if (salesBox == null) return null;
    List<Widget> items = [];
    items.add(_otherItems(
        context, salesBox?.bigCard1, salesBox?.bigCard2, true, false));
    items.add(_otherItems(
        context, salesBox?.smallCard1, salesBox?.smallCard2, false, false));
    items.add(_otherItems(
        context, salesBox?.smallCard3, salesBox?.smallCard4, false, true));
    return Column(
      children: [
        _topItem(context),
        items[0],
        items[1],
        items[2],
      ],
    );
  }

  Widget _topItem(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            salesBox?.icon ?? "",
            height: 15,
            fit: BoxFit.fill,
          ),
          Container(
            margin: const EdgeInsets.only(right: 7),
            padding: const EdgeInsets.fromLTRB(10, 1, 8, 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(colors: [
                Color(0xffff4e63),
                Color(0xffff6cc9),
              ]),
            ),
            child: GestureDetector(
              onTap: () {
                NavigatorUtil.push(
                  context,
                  Webview(url: salesBox?.moreUrl ?? "", title: '更多活动'),
                );
              },
              child: const Text(
                '获取更多福利 >',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _otherItems(BuildContext context, CommonModel? model1, CommonModel? model2,
      bool isBigItem, bool isLast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _otherItem(context, model1, true, isBigItem, isLast),
        _otherItem(context, model2, false, isBigItem, isLast),
      ],
    );
  }

  _otherItem(BuildContext context, CommonModel? model, bool isLeft,
      bool isBigItem, bool isLast) {
    BorderSide borderSide =
        const BorderSide(width: 0.8, color: Color(0xfff2f2f2));
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            Webview(
              url: model?.url ?? "",
              statusBarColor: model?.statusBarColor,
              hideAppBar: model?.hideAppBar,
            ));
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: isLeft ? borderSide : BorderSide.none,
              bottom: isLast ? BorderSide.none : borderSide,
            ),
          ),
          child: Image.network(
            model?.icon ?? "",
            width: MediaQuery.of(context).size.width / 2 - 10,
            height: isBigItem ? 129 : 80,
            fit: BoxFit.fill,
          )),
    );
  }
}
