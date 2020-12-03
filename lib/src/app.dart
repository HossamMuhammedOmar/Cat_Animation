import 'package:cat_animation/src/screens/animation_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Tom'),
        ),
        body: AnimationScreen(),
      ),
    );
  }
}
