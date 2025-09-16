import 'package:flutter/material.dart';
import '../model/common_model.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel>? localNavList;

  const LocalNav({super.key, this.localNavList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
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
    if (localNavList == null) return null;
    List<Widget> list = localNavList!.map((CommonModel commonModel) {
      return GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Image.network(
              commonModel.icon ?? "",
              width: 32,
              height: 32,
            ),
            Text(
              commonModel.title ?? "",
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      );
    }).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }
}
