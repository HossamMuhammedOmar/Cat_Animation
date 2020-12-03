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
      duration: Duration(seconds: 2),
    );

    // init tomAnimation
    tomAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: tomContoller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Cat(),
      ),
    );
  }
}
