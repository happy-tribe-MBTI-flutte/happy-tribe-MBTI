import 'package:flutter/material.dart';
import 'package:mbti/question.dart';
import 'package:mbti/result.dart';

import 'resultMusic.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('메인페이지')),
      body: Container(
        child: Column(children: [
          Text('dd'),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultMusic()),
                );
              },
              child: Text('mbti 검사하기 버튼')),
          result()
          // Expanded(child: MBTIQuestionPage()),
        ]),
      ),
    );
  }
}
