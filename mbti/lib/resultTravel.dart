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
              image: AssetImage("assets/page_img/r_img1.png"),
            ),
          ),
        ),
      ),
    );
  }
  class MyData {
  final String img;
  final String explanation;
  final String overseas;
  final String domestic;
  final String state; // state 변수 추가

  MyData({
    required this.img,
    required this.explanation,
    required this.overseas,
    required this.domestic,
    required this.state, // state 변수 추가
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      img: json['img'] ?? '',
      explanation: json['explanation'] ?? '',
      overseas: json['Overseas'] ?? '',
      domestic: json['Domestic'] ?? '',
      state: json['state'] ?? '', // state 변수 추가
    );
  }
}

void main() {
  // 예시 JSON 데이터
  Map<String, dynamic> jsonData = {
    'img': 'image_url',
    'explanation': 'some explanation',
    'Overseas': 'overseas value',
    'Domestic': 'domestic value',
    'state': 'some state', // state 변수 추가
  };

  // JSON 데이터를 Dart 객체로 변환
  MyData myData = MyData.fromJson(jsonData);

  // Dart 객체 출력
  print('img: ${myData.img}');
  print('explanation: ${myData.explanation}');
  print('Overseas: ${myData.overseas}');
  print('Domestic: ${myData.domestic}');
  print('state: ${myData.state}'); // state 변수 출력
}
}
