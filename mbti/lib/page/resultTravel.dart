// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:mbti/model/mbti_travel.dart';

import '../widget/trvel_img_slider.dart';

// void main() {
//   runApp(resultTravel());
// }

class resultTravel extends StatelessWidget {
  const resultTravel({super.key, this.mbti});
  final mbti;

  @override
  Widget build(BuildContext context) {
    MbtiTravel mbtiModel;
    var selectedMBTI;

    Future MbtiJsonDecode() async {
      String data = await rootBundle
          .loadString('travel_assets/travel_json/new_travel.json');
      selectedMBTI = jsonDecode(data);

      if (selectedMBTI != null) {
        // mbtiModel = MbtiTravel.fromMap(selectedMBTI["${mbti.toUpperCase()}"]);
        mbtiModel = MbtiTravel.fromMap(selectedMBTI["ENFP"]);

        return mbtiModel;
      } else {
        print("실패");

        return null;
      }
    }

    const colorizeColors = [
      Colors.blue,
      Colors.purple,
      Colors.yellow,
      Colors.red,
      Colors.green,
      Colors.amber,
    ];
    const colorizeTextStyle = TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    );

    return FutureBuilder(
      future: MbtiJsonDecode(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator()); // 데이터 로딩 중인 경우 로딩 스피너 표시
        } else if (snapshot.hasError) {
          return Text('에러 Error: ${snapshot.error}');
        } else {
          MbtiTravel futureDate = snapshot.data; // 데이터를 가져옴
          return Scaffold(
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 1, -0.1],
                    colors: [
                      Color.fromARGB(227, 255, 117, 214), // Use the custom gold color here
                      Colors.yellowAccent.shade100,
                      Color.fromARGB(255, 252, 251, 247),
                    ],
                  ),
                ),
                height: 830,
                width: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(20),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            child: Center(
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText("${futureDate.title}",
                                      textStyle: colorizeTextStyle,
                                      colors: colorizeColors,
                                      speed: Duration(seconds: 2))
                                ],
                                isRepeatingAnimation: true,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                        
                          child: Center(
                              child: Text(
                            // "${mbti.toUpperCase()}",
                            "ENTP",
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          height: 370,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              color: Colors.blue),
                          child: Column(
                            children: [
                              Expanded(
                                child: TravelImgSlider(
                                  futureDate: futureDate,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('한국',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text(futureDate.Domestic,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Image(
                                      alignment: Alignment.center,
                                      image:
                                          AssetImage('page_img/airplane.png'),
                                      fit: BoxFit.contain),
                                  Column(
                                    children: [
                                      Text('외국 ',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                      Text(futureDate.Overseas,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  child: Text(futureDate.explanation,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 180,
                          margin: EdgeInsets.all(8),
                          child: Center(
                              child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    futureDate.expl,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                  if (futureDate.expl.length > 15)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextButton(
                                        child: Text(
                                          "더보기",
                                        ),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              barrierDismissible:
                                                  true, // 바깥 영역 터치시 닫을지 여부
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                          '${mbti.toUpperCase()}')),
                                                  content: Container(
                                                    height: 400,
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Text(
                                                          "${futureDate.expl + futureDate.expl_Add}"),
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      child: Text('확인'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                      ),
                                    )
                                ],
                              ),
                            ),
                          )),
                        )
                      ]),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
