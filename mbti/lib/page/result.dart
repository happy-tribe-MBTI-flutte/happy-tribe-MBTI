import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:mbti/page/main_page.dart';
import 'package:mbti/page/resultDrink.dart';
import 'package:mbti/page/resultTravel.dart';

class Result extends StatefulWidget {
  final dynamic mbtiResult;
  const Result({super.key, this.mbtiResult});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool a = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Create an animation to move the light effect diagonally
  }

  @override
  Widget build(BuildContext context) {
    String mbtiResult = widget.mbtiResult;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(247, 160, 150, 235),
            padding: const EdgeInsets.all(20),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
          onPressed: () {
            dispose();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          child: const Text(
            "처음으로 돌아가기",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Center(
        child: SizedBox(
          width: 390,
          height: 844,
          child: FlipCard(
            fill: Fill
                .fillBack, // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL, // default
            side: CardSide.FRONT, // The side to initially display.
            front: ResultTravel(
              mbti: mbtiResult,
            ),
            back: ResultDrink(mbti: mbtiResult),
          ),
        ),
      ),
    );
  }
}
