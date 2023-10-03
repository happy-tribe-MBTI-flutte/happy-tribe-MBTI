import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: CustomAppBar(progressValue, currentQuestionIndex),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15.0),
            Center(
              child: Text(
                currentQuestion['question'],
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedAnswers.add('a');
                  _printSelectedAnswer();
                  _nextQuestion();
                });
              },
              child: Text('a: ${options['a']}'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedAnswers.add('b');
                  _printSelectedAnswer();
                  _nextQuestion();
                });
              },
              child: Text('b: ${options['b']}'),
            ),
          ],
        ),
      ),
    );
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      progressValue += 1 / 70;
      currentQuestionIndex++;
    } else {
      // 마지막 문제에서는 선택한 답을 출력
      print('Selected Answers: $selectedAnswers');
    }
  }

  void _printSelectedAnswer() {
    print(
        'Selected Answer for Question ${currentQuestionIndex + 1}: ${selectedAnswers.last}');
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double progressValue;
  final int currentQuestionIndex;

  const CustomAppBar(this.progressValue, this.currentQuestionIndex);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        height: 40.0, // 조절 가능한 마진 크기
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
