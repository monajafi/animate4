import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2),vsync: this);
    animation = Tween<double>(begin: 0,end: 300).animate(controller);
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: LogoWidget(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

   GrowTransition({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context,child) => Container(
          width: animation.value,
          height: animation.value,
          child: child,
        ),
        child: child,
      ),
    );
  }
}
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}
