import 'package:flutter/material.dart';

///搜索入口
//home:首页样式,normal:搜索页正常展示样式，homeLight：首页滚动时高亮样式
enum SearchBarType { home, normal, homeLight }

class SearchBar extends StatefulWidget {
  bool? enableSearch; //是否启用搜索
  bool? hideLeftButton; //是否隐藏左侧按钮
  SearchBarType? searchBarType;
  String? hitText; //输入框提示文案
  String? defaultText;
  void Function()? leftButtonClick; //左侧按钮点击回调
  void Function()? rightButtonClick; //右侧按钮点击回调
  void Function()? speakClick; //语音按钮点击回调
  void Function()? inputBoxClick; //输入框点击回调
  ValueChanged<String>? onChanged; //输入框内容变化回调

  SearchBar({
    super.key,
    this.enableSearch = true, //默认状态启用搜索
    this.hideLeftButton,
    this.searchBarType = SearchBarType.normal, //默认搜索
    this.hitText,
    this.defaultText,
    this.leftButtonClick,
    this.rightButtonClick,
    this.speakClick,
    this.inputBoxClick,
    this.onChanged,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  //TextEditingController动态获取输入框文字变化
  final TextEditingController _controller = TextEditingController();

  //是否显示输入框中清除按钮
  bool showClearIcon = false;

  @override
  void initState() {
    //进入到搜索页的时候，输入框展示的搜索文案
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText!;
        _onChangedText(_controller.text);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  _wrapGestureTap(void Function()? onClick, Widget child) {
    return GestureDetector(onTap: onClick, child: child);
  }

  Widget _genNormalSearch() {
    return Container(
      child: Row(
        children: [
          _wrapGestureTap(
            //左侧按钮
            widget.leftButtonClick,
            Container(
              //设置返回按钮边距
              padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
              child: widget.hideLeftButton ?? false
                  ? null
                  : const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 26,
                    ),
            ),
          ),
          Expanded(flex: 1, child: _inputBox()), //中间搜索框
          _wrapGestureTap(
            //右侧搜索按钮
            widget.rightButtonClick,
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: const Text(
                "搜索",
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _genHomeSearch() {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              _wrapGestureTap(
                //左侧按钮
                widget.leftButtonClick,
                Container(
                  //设置返回按钮边距
                  padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
                  child: Row(
                    children: [
                      Text(
                        "上海",
                        style: TextStyle(color: _homeFontColor(), fontSize: 14),
                      ),
                      Icon(
                        Icons.expand_more,
                        color: _homeFontColor(),
                        size: 22,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(flex: 1, child: _inputBox()), //中间搜索框
          _wrapGestureTap(
            //右侧搜索按钮
            widget.rightButtonClick,
            Container(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Icon(
                Icons.comment,
                color: _homeFontColor(),
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //中间输入框
  Widget _inputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse("0xffEDEDED"));
    }
    return Container(
      height: 30,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: inputBoxColor,
        borderRadius: BorderRadius.circular(
            widget.searchBarType == SearchBarType.normal ? 5 : 15),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(int.parse("0xffA9A9A9"))
                : Colors.blue,
            size: 20,
          ),
          Expanded(
            flex: 1,
            child: widget.searchBarType == SearchBarType.normal
                ? TextField(
                    controller: _controller,
                    onChanged: _onChangedText,
                    autofocus: true,
                    style: const TextStyle(
                      //设置输入框文字样式
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    //设置输入框样式
                    decoration: InputDecoration(
                      //如果设置contentPadding，则必须添加isDense属性(紧凑模式，去除多余的高度)
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      border: InputBorder.none,
                      hintText: widget.hitText ?? "",
                      hintStyle: const TextStyle(fontSize: 15),
                    ),
                  )
                : _wrapGestureTap(
                    widget.inputBoxClick,
                    Container(
                      child: Text(
                        widget.defaultText ?? "",
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                  ),
          ),
          !showClearIcon
              ? _wrapGestureTap(
                  widget.speakClick,
                  Icon(
                    Icons.mic,
                    color: widget.searchBarType == SearchBarType.normal
                        ? Colors.blue
                        : Colors.grey,
                    size: 22,
                  ),
                )
              : _wrapGestureTap(
                  () {
                    setState(() {
                      _controller.clear();
                    });
                    _onChangedText("");
                  },
                  const Icon(
                    Icons.clear,
                    color: Colors.grey,
                    size: 22,
                  ),
                ),
        ],
      ),
    );
  }

  //监听输入框文本变化,是否显示清除输入框内容按钮
  _onChangedText(String text) {
    if (text.isNotEmpty) {
      setState(() {
        showClearIcon = true;
      });
    } else {
      setState(() {
        showClearIcon = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  //获取首页前景色
  Color _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}
