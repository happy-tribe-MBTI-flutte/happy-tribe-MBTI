import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mbti/question.dart';
import 'package:mbti/result.dart';

import 'resultMusic.dart';

void main() {
  runApp(MaterialApp(
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  var mbtiStr = "intp";
  bool _play = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/page_img/m_img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            // 이미지 버튼을 추가합니다.
            onTap: () {
              // 이미지 버튼을 눌렀을 때 실행할 동작을 여기에 추가합니다.
            },
            child: Container(
              padding: EdgeInsets.all(10), // 이미지 주변에 여백을 추가합니다.
              child: Image.asset(
                'assets/page_img/github_img.png', // 이미지의 경로를 지정합니다.
                width: 50, // 이미지의 너비를 조정합니다.
                height: 50, // 이미지의 높이를 조정합니다.
              ),
            ),
          ),
          AudioWidget.assets(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _play = !_play;
                  });
                },
                child: Text(_play ? '멈춤' : '재생')),
            path: 'assets/audios/background.mp3',
            play: _play,
          ),
          Text(
            // '나와 맞는 여행지에 어울리는 술과 노래는 뭘까?',
            '내 소울 여행지와 어울리는 술과 노래는?',
            style: TextStyle(
                letterSpacing: 1, fontSize: 15, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Text('흥의 민족',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          Text('MBTI',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(246, 235, 97, 223))),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(247, 160, 150, 235),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MBTIQuestionPage()),
                  );
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '테스트 하러가기',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   height: 100,
          //   child: ResultMusic(),
          // ),
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(247, 160, 150, 235)),
              // style: ElevatedButton.styleFrom(maximumSize: Size(100, 100)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => result(
                            mbtiResult: 'intp',
                          )),
                );
              },

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '결과 예시',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
