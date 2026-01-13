import 'package:flutter/material.dart';

///语音界面
class SpeakPage extends StatefulWidget {
  SpeakPage({super.key});

  @override
  State<SpeakPage> createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? animation;
  String speakResult = '';

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器，设置动画持续时间和vsync
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    // 创建曲线动画，使用easeInOut曲线效果
    animation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut);
    // 添加动画状态监听器，实现循环动画效果
    animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画完成时反向执行
        _animationController?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画结束时正向执行
        _animationController?.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_topItem(), _bottomItem()],
          ),
        ),
      ),
    );
  }

  _topItem() {
    return Column(
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Text('你可以这样说',
                style: TextStyle(fontSize: 16, color: Colors.black54))),
        const Text('故宫门票\n北京一日游\n迪士尼乐园',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            )),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            speakResult,
            style: TextStyle(color: Colors.blue),
          ),
        )
      ],
    );
  }

  _bottomItem() {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: [
          GestureDetector(
            onTapDown: (e) => {_speakStart()},
            onTapUp: (e) => {_speakStop()},
            onTapCancel: () {
              _speakStop();
            },
            child: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "长按说话",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  // 使用Stack包装麦克风组件，便于后续扩展功能，如添加浮动提示或其他覆盖元素
                  Stack(
                    children: [
                      Container(
                        width: MIC_SIZE,
                        height: MIC_SIZE,
                        child: AnimalMic(listenable: _animationController!),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _speakStart() {
    _animationController?.forward();
  }

  _speakStop() {
    _animationController?.reset();
    _animationController?.stop();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }
}

const double MIC_SIZE = 80;

class AnimalMic extends AnimatedWidget {
  final _scaleTween = Tween<double>(begin: 1.0, end: 0.8);
  final _colorTween = ColorTween(begin: Colors.blue, end: Colors.blue.shade300);

  AnimalMic({required super.listenable});

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
/*这段代码实现了一个带有动画效果的麦克风按钮组件，让我来详细解释一下：
这段代码创建了一个可缩放和变色的圆形麦克风图标：
1. `Transform.scale` - 根据动画值调整图标的缩放比例，范围在1.0到0.8之间
2. `Container` - 创建一个圆形容器，尺寸为MIC_SIZE x MIC_SIZE
3. `BoxDecoration` - 定义了容器的外观：
   - 背景色会根据动画在蓝色和浅蓝色之间渐变
   - 圆角半径设为MIC_SIZE/2，形成完美的圆形
   - 添加了蓝色阴影效果，增强视觉层次感
4. `Icon(Icons.mic)` - 在圆形容器中心放置白色话筒图标

这个组件配合手势检测器，当用户长按说话时，麦克风图标会缩小并变暗，同时播放循环动画，提供直观的视觉反馈。*/

        // 使用Transform.scale组件根据动画值改变麦克风图标的大小
        return Transform.scale(
          // 通过_scaleTween.evaluate获取当前动画对应的缩放值
          scale: _scaleTween.evaluate(animation),
          child: Container(
            // 设置固定的宽高，保持圆形比例
            width: MIC_SIZE,
            height: MIC_SIZE,
            // 使用BoxDecoration定义圆形背景和阴影效果
            decoration: BoxDecoration(
              // 颜色会根据_colorTween在蓝色系范围内变化
              color: _colorTween.evaluate(animation),
              // 圆角半径为直径的一半，形成圆形
              borderRadius: BorderRadius.circular(MIC_SIZE / 2),
              // 添加阴影效果提升视觉层次
              boxShadow: [
                BoxShadow(
                  // 半透明蓝色阴影
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 10, // 模糊半径
                  spreadRadius: 2, // 扩散半径
                )
              ],
            ),
            // 显示白色的麦克风图标
            child: const Icon(
              Icons.mic,
              color: Colors.white, // 图标颜色为白色
              size: 30, // 图标大小
            ),
          ),
        );
      },
    );
  }
}
