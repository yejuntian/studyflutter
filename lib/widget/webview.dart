import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

//白名单网址
const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class Webview extends StatefulWidget {
  String? url;
  String? statusBarColor;
  String? title;
  bool? hideAppBar;
  bool? backForbid;

  Webview({
    super.key,
    this.url,
    this.statusBarColor,
    this.title,
    this.hideAppBar,
    this.backForbid = false,
  });

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late final WebViewController _controller;

  //是否返回上一页
  bool isBackPreviousPage = false;

  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        onPageStarted: (String url) {
          print("WebView onPageStarted url is : $url");
          if (_isToMain(url) && !isBackPreviousPage) {
            if (widget.backForbid ?? false) {
              // 重新加载指定url
              controller.loadRequest(Uri.parse(widget.url ?? ""));
            } else {
              Navigator.pop(context);
              isBackPreviousPage = true;
            }
          }
        },
        onPageFinished: (String url) {
          print("WebView onPageFinished url is : $url");
        },
        onHttpError: (HttpResponseError error) {
          print(
              'WebView Error occurred on page: ${error.response?.statusCode}');
        },
        onUrlChange: (UrlChange change) {
          print('WebView url change to ${change.url}');
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
    controller.loadRequest(Uri.parse(widget.url ?? ""));
    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    //初始化状态栏颜色
    String statusBarColor = widget.statusBarColor ?? "ffffff";
    //初始化返回按钮颜色
    Color backButtonColor;
    if (widget.statusBarColor == "ffffff") {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: [
          _appBar(Color(int.parse("0xff$statusBarColor")), backButtonColor),
          Expanded(
            child: WebViewWidget(
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }

  _appBar(Color? backgroundColor, Color? backButtonColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: 30,
      );
    } else {
      return Container(
        color: backgroundColor,
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.close,
                    color: backButtonColor,
                    size: 26,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    widget.title ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      color: backButtonColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  //判断是否要返回首页
  bool _isToMain(String? netUrl) {
    bool contains = false;
    for (var url in CATCH_URLS) {
      if (netUrl?.endsWith(url) ?? false) {
        contains = true;
        break;
      }
    }
    return contains;
  }
}
