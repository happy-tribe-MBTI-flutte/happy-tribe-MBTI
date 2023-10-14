import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mbti/page/github_page.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        hoverColor: Colors.transparent,
        focusElevation: 0,
        elevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GithubPage()));
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "main/github.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('page_img/m_img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AudioWidget.assets(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _play = !_play;
                  });
                },
                child: Text(_play ? '멈춤' : '재생')),
            path: 'audios/background.mp3',
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
                            mbtiResult: 'esfp',
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
