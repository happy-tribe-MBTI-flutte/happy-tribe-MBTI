import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbti/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  double progressValue = 1 / 70;

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent, // 배경색을 투명하게 설정
        elevation: 0, // 그림자 제거
        title: SizedBox(
          height: 40.0,
          child: LinearProgressIndicator(value: progressValue),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Text(
            '< ${currentQuestionIndex + 1} / 70 >',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.0),
                  Center(
                    child: Text(
                      currentQuestion['question'],
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      _onOptionSelected('a');
                    },
                    child: Text('a: ${options['a']}'),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      _onOptionSelected('b');
                    },
                    child: Text('b: ${options['b']}'),
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      if (currentQuestionIndex > 0) {
                        _goToPreviousPage();
                      }
                    },
                    child: Text('이전 문항으로'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40.0),
                      // 1번 문항에서는 버튼을 비활성화
                      // (currentQuestionIndex > 0일 때만 버튼이 활성화되도록)
                      primary: currentQuestionIndex > 0 ? null : Colors.grey,
                    ),
                  ),
                ],
              ),
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
          builder: (context) => result(mbtiResult: mbtiResult),
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
