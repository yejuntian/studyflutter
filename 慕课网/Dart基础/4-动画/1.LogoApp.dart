import 'package:flutter/cupertino.dart';

void main() {
  runApp(LogoApp());
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  late double animationValue = 0;
  AnimationStatus? animationStatus;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    Tween<double> tween = Tween<double>(begin: 0, end: 200);
    animation = tween.animate(controller);

    animation.addListener(() {
      setState(() {
        animationValue = animation.value;
      });
    });
    animation.addStatusListener((status) {
      setState(() {
        animationStatus = status;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              controller.reset();
              controller.forward();
            },
            child: const Text(
              'Start',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Text(
            'State$animationStatus',
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            "Value$animationValue",
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          SizedBox(
            width: animationValue,
            height: animationValue,
            child: const FlutterLogo(),
          )
        ],
      ),
    );
  }
}
