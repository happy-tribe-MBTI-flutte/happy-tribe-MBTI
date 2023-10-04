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
  var mbtiStr = "intp";
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('page_img/m_img.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '나와 맞는 여행지에 어울리는 술과 노래는 뭘까?',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('흥의 민족',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text('MBTI',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                SizedBox(
                  height: 40,
                ),
    
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    // style: ElevatedButton.styleFrom(maximumSize: Size(100, 100)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MBTIQuestionPage()),
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '테스트 하러가기',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(height: 300 ,child: result(selectMbti :mbtiStr ))
                // Expanded(child: MBTIQuestionPage()),
              ]),
        ),
      );
  }
}
