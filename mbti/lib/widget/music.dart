import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(MaterialApp(home: ResultMusic()));
}

class ResultMusic extends StatefulWidget {
  const ResultMusic({super.key, this.mbti});
  final mbti;

  @override
  State<ResultMusic> createState() => _ResultMusicState();
}

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];
const colorizeTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class _ResultMusicState extends State<ResultMusic> {
  var playlist = {
    "INFJ": "io0cVw3IxT8",
    "INFP": "RYZMbzksrKA",
    "INTP": "iz4xS8Ff72Y",
    "INTJ": "zIZzfJZAkIU",
    "ISTJ": "oH0rDHpVOlw",
    "ISFJ": "h1w83jr6v7w",
    "ISTP": "pzITbqeA5i4",
    "ISFP": "WCqtFWjCtaM",
    "ESTP": "k3uC15-GoKk",
    "ESFP": "OUUj7aKHPpA",
    "ESTJ": "UvHukCh4_JY",
    "ESFJ": "MpQZMObaueI",
    "ENFP": "w3VV16WEr9k",
    "ENTP": "RH6H0Tb-qsU",
    "ENFJ": "Cf5zMPAWnZo",
    "ENTJ": "FQp8L7mpQig",
  };
  Map<String, dynamic>? parsedJson; // JSON 데이터를 저장할 변수

  Future<void> loadJsonData() async {
    final String jsonData =
        await rootBundle.loadString('music/music_data.json');
    parsedJson = json.decode(jsonData);

    setState(() {});
  }

  youtue(String mbtiURl) {
    YoutubePlayerController _controller = YoutubePlayerController.fromVideoId(
      videoId: mbtiURl,
      params: YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
    return _controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
  }

  // 이제 parsedJson 변수에 JSON 데이터가 저장됩니다.
  @override
  Widget build(BuildContext context) {
    String? videoId = playlist["${widget.mbti}"];
    print("videoId  :" + videoId.toString());

    return Scaffold(
      body: Container(
        child: parsedJson == null
            ? null
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    child: YoutubePlayer(
                      controller: youtue(parsedJson!['${widget.mbti}']['url']),
                      aspectRatio: 16 / 9,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                '${widget.mbti}에게 어울리는',
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                              ),
                              ColorizeAnimatedText(
                                '추천 음악 리스트!!',
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                              ),
                            ],
                            isRepeatingAnimation: true,
                          ),
                        ),
                        Text('${parsedJson!['${widget.mbti}']['description']}'),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
