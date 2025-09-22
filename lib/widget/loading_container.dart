import 'package:flutter/material.dart';

///加载进度条组件
class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  bool cover;

  LoadingContainer({
    super.key,
    required this.child,
    required this.isLoading,
    this.cover = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!cover) {
      if (!isLoading) {
        return child;
      } else {
        return _loadingView;
      }
    } else {
      return Stack(
        children: [child, isLoading ? _loadingView : Container()],
      );
    }
  }
}

Widget get _loadingView => const Center(
      child: CircularProgressIndicator(),
    );
