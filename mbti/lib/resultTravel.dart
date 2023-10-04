// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mbti/question.dart';

void main() {
  runApp(resultTravel());
}

class resultTravel extends StatelessWidget {
  const resultTravel({super.key, this.mbti});
  final mbti;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 420,
          height: 1200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "/Users/sonseongmin/Desktop/Project/8vengers/mbti/assets/page_img/r_img1.png"),
            ),
          ),
        ),
      ),
    );
  }
}
