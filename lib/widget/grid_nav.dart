import 'package:flutter/material.dart';
import 'package:studyflutter/model/common_model.dart';
import 'package:studyflutter/widget/webview.dart' show Webview;

import '../model/grid_nav_model.dart';

class GridNav extends StatelessWidget {
  GridNavModel? gridNavModel;

  GridNav({super.key, this.gridNavModel});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias, // 必须加这个
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Column(children: _gridNavItems(context)),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel?.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel?.hotel, true));
    }
    if (gridNavModel?.flight != null) {
      items.add(_gridNavItem(context, gridNavModel?.flight, false));
    }
    if (gridNavModel?.travel != null) {
      items.add(_gridNavItem(context, gridNavModel?.travel, false));
    }
    return items;
  }

  _gridNavItem(BuildContext context, GridNavItem? gridNavItem, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, gridNavItem?.mainItem));
    items.add(_doubleItem(context, gridNavItem?.item1, gridNavItem?.item2));
    items.add(_doubleItem(context, gridNavItem?.item3, gridNavItem?.item4));

    Color startColor =
        Color(int.parse("0xff${gridNavItem?.startColor ?? 'ffffff'}"));
    Color endColor =
        Color(int.parse("0xff${gridNavItem?.endColor ?? 'ffffff'}"));

    //给外层Row的item使用Expanded分配相同宽度，这样 Row 内部会自动分配宽度，每个 Column 就有明确的约束，否则报错
    List<Widget> newItems = [];
    items.asMap().forEach((index, item) {
      if (index == 0) {
        newItems.add(Expanded(flex: 1, child: item));
      } else {
        newItems.add(Expanded(flex: 1, child: item));
      }
    });
    return Container(
      height: 88, // 给 Row 的子 Column 明确了高度
      margin: first ? null : const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [startColor, endColor]),
      ),
      //Row子元素用了 Expanded,子元素会 平分父容器的高度，因为 Expanded 会告诉 Column:“我要占据父容器剩余的空间”
      //如果有多个 Expanded，会按 flex 权重来分配
      child: Row(children: newItems),
    );
  }

  //左侧第一个Item
  Widget _mainItem(BuildContext context, CommonModel? model) {
    return _wrapGesture(
      context,
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.network(
            model?.icon ?? "",
            height: 88,
            width: 121,
            fit: BoxFit.contain,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Container(
            margin: const EdgeInsets.only(top: 11),
            child: Text(
              model?.title ?? "",
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
      model,
    );
  }

  //两个组合到一起的item
  Widget _doubleItem(
      BuildContext context, CommonModel? topModel, CommonModel? bottomModel) {
    //Column子元素用了 Expanded,子元素会 平分父容器的高度，因为 Expanded 会告诉 Column:“我要占据父容器剩余的空间”
    //如果有多个 Expanded，会按 flex 权重来分配
    return Column(
      children: [
        Expanded(flex: 1, child: _item(context, topModel, true)),
        Expanded(flex: 1, child: _item(context, bottomModel, false))
      ],
    );
  }

  //单个item
  _item(BuildContext context, CommonModel? model, bool isFirst) {
    BorderSide borderSide = const BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: borderSide,
          bottom: isFirst ? borderSide : BorderSide.none,
        )),
        child: _wrapGesture(
            context,
            Center(
              child: Text(
                model?.title ?? "",
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            model),
      ),
    );
  }

  Widget _wrapGesture(BuildContext context, Widget widget, CommonModel? model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Webview(
              title: model?.title,
              url: model?.url,
              statusBarColor: model?.statusBarColor,
              hideAppBar: model?.hideAppBar);
        }));
      },
      child: widget,
    );
  }
}
