// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, deprecated_member_use, avoid_print, sized_box_for_whitespace

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbti/page/main_page.dart';
import 'package:mbti/page/result.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Pretendard'),
      themeMode: ThemeMode.system,
      home: MBTIQuestionPage(),
    );
  }
}

class MBTIQuestionPage extends StatefulWidget {
  @override
  _MBTIQuestionPageState createState() => _MBTIQuestionPageState();
}

class _MBTIQuestionPageState extends State<MBTIQuestionPage> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    String data = await rootBundle.loadString('assets/mbti.json');
    Map<String, dynamic> jsonData = json.decode(data);
    jsonData.forEach((key, value) {
      questions.add(value);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    Map<String, dynamic> currentQuestion = questions[currentQuestionIndex];
    Map<String, dynamic> options = currentQuestion['options'];

    return Scaffold(
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('page_img/m_img.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: LinearProgressIndicator(
                              minHeight: 12,
                              value: progressValue,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF5D90FF)),
                              backgroundColor: Color(0xffd6d6d6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          Positioned(
                            left: -75 + progressValue * 370 * 0.85,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Image.asset(
                                'question_img/plane.png', // 이미지 파일 경로에 맞게 수정해야 함
                                width: 220, // 이미지의 너비
                                height: 220, // 이미지의 높이
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: PreferredSize(
                          preferredSize: Size.fromHeight(30.0),
                          child: Text(
                            '< ${currentQuestionIndex + 1} / 70 >',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 170.0),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Container(
                                constraints: BoxConstraints(
                                  minHeight: 80.0, // 최소 높이를 원하는 값으로 설정
                                ),
                                child: Text(
                                  currentQuestion['question'],
                                  style: GoogleFonts.jua(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          SizedBox(
                            height: 70,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return const Color.fromARGB(
                                          221, 253, 166, 252);
                                    }
                                    return const Color.fromARGB(
                                        247, 160, 150, 235);
                                  }),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.white;
                                    }
                                  }),
                                ),
                                onPressed: () {
                                  _onOptionSelected('a');
                                },
                                child: Text(
                                  'A. ${options['a']}',
                                  style: GoogleFonts.jua(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(
                            height: 70,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const Color.fromARGB(
                                        221, 253, 166, 252);
                                  }
                                  return const Color.fromARGB(
                                      247, 160, 150, 235);
                                }),
                                foregroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.white;
                                  }
                                }),
                              ),
                              onPressed: () {
                                _onOptionSelected('b');
                              },
                              child: Text(
                                'B. ${options['b']}',
                                style: GoogleFonts.jua(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Center(
                            child: Container(
                              width: 100,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states) {
                                        return RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0), // 원하는 모서리 반지름 값으로 설정
                                        );
                                      },
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return const Color.fromARGB(
                                            221, 253, 166, 252);
                                      }
                                      return const Color.fromARGB(
                                          247, 160, 150, 235);
                                    }),
                                    foregroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.white;
                                      }
                                    }),
                                  ),
                                  onPressed: () {
                                    if (currentQuestionIndex == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainPage()),
                                      );
                                    }
                                    if (currentQuestionIndex > 0) {
                                      _goToPreviousPage();
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onOptionSelected(String option) {
    if (selectedAnswers.length < 70) {
      setState(() {
        selectedAnswers.add(option);
        _printSelectedAnswer();
        _nextQuestion();
      });
      print('Selected Answers: $selectedAnswers');
      if (currentQuestionIndex == 69) {
        _calculateMBTI();
        // 여기에 결과 페이지로 이동하는 코드를 추가
      }
    } else {
      print('All questions answered. Selected Answers: $selectedAnswers');
    }
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      progressValue += 1 / 70;
      currentQuestionIndex++;
    }
  }

  void _printSelectedAnswer() {
    print(
        'Selected Answer for Question ${currentQuestionIndex + 1}: ${selectedAnswers.last}');
  }

  void _goToPreviousPage() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        progressValue -= 1 / 70;
        selectedAnswers.removeLast(); // 이전 페이지로 이동할 때 마지막 선택 값을 삭제
      });
    }
  }

  void _calculateMBTI() {
    if (selectedAnswers.length == 70) {
      // Calculate MBTI based on the selected answers
      String mbtiResult = _calculateDimension(
              'E', 'I', [1, 8, 15, 22, 29, 36, 43, 50, 57, 64]) +
          _calculateDimension(
              'S', 'N', [2, 9, 16, 23, 30, 37, 44, 51, 58, 65]) +
          _calculateDimension('T', 'F', [
            4,
            5,
            11,
            12,
            18,
            19,
            25,
            26,
            32,
            33,
            39,
            40,
            46,
            47,
            53,
            54,
            60,
            61,
            67,
            68
          ]) +
          _calculateDimension('J', 'P', [
            6,
            7,
            13,
            14,
            20,
            21,
            27,
            28,
            34,
            35,
            41,
            42,
            48,
            49,
            55,
            56,
            62,
            63,
            69,
            70
          ]);

      print('Your MBTI result: $mbtiResult');

      // 이전 페이지를 스택에서 제거하면서 결과 페이지로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Result(mbtiResult: mbtiResult),
        ),
      );
    } else {
      print('Please answer all questions before calculating MBTI.');
    }
  }

  String _calculateDimension(
      String dimensionA, String dimensionB, List<int> questions) {
    int countA = 0;
    int countB = 0;

    for (int questionIndex in questions) {
      String selectedAnswer = selectedAnswers[questionIndex - 1].toLowerCase();
      if (selectedAnswer == 'a') {
        countA++;
      } else if (selectedAnswer == 'b') {
        countB++;
      }
    }

    return countA > countB ? dimensionA : dimensionB;
  }
}
