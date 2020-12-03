import 'package:cat_animation/src/box.dart';
import 'package:flutter/material.dart';

import '../cat.dart';

class AnimationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationScreenState();
  }
}

class AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  Animation<double> tomAnimation;
  AnimationController tomContoller;

  @override
  void initState() {
    super.initState();
    // Init tomController
    tomContoller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    // init tomAnimation
    tomAnimation = Tween(begin: 110.0, end: 260.0).animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: tomContoller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            buildTomAnimation(),
            buildBox(),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  // create helper method for builder
  Widget buildTomAnimation() {
    return AnimatedBuilder(
      animation: tomAnimation,
      builder: (context, child) {
        return Positioned(
          bottom: tomAnimation.value,
          left: 0,
          right: 0,
          child: child,
        );
      },
      child: Cat(),
    );
  }

  // create helper method for box
  Widget buildBox() {
    return Box();
  }

  void onTap() {
    print(num);
    if (tomContoller.status == AnimationStatus.completed) {
      tomContoller.reverse();
    } else if (tomContoller.status == AnimationStatus.dismissed) {
      tomContoller.forward();
    }
  }
}
