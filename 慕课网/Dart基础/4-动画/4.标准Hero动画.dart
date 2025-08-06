import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(HeroAnimation());
}

class PhotoHero extends StatelessWidget {
  String photo;
  VoidCallback onTap;
  double width;

  PhotoHero({
    super.key,
    required this.photo,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation extends StatefulWidget {
  HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  final GlobalKey<NavigatorState> _globalKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    //1.0 means normal animation speed.
    timeDilation = 10.0;

    return MaterialApp(
      title: 'Basic Hero Animation',
      navigatorKey: _globalKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Hero Animation'),
        ),
        body: Center(
          child: PhotoHero(
            photo:
                "https://qcloud.dpfile.com/pc/6it6-wSAtuDIQ4I0sC7Mwl-38nWSg4HL9q5EUval_2sJ7OUzNmXLyzmJmWen46VO.jpg",
            width: 200,
            onTap: () {
              _globalKey.currentState?.push(
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text("Flippers Page"),
                      ),
                      body: Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        child: PhotoHero(
                          photo:
                              "https://qcloud.dpfile.com/pc/6it6-wSAtuDIQ4I0sC7Mwl-38nWSg4HL9q5EUval_2sJ7OUzNmXLyzmJmWen46VO.jpg",
                          width: 100,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
