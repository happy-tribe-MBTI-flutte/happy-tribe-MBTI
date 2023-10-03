import 'package:flutter/material.dart';
import 'package:mbti/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('메인페이지')),
        body: Container(
          child: Column(children: [
            Expanded(child: MBTIQuestionPage()),
          ]),
        ),
      ),
    );
  }
}
