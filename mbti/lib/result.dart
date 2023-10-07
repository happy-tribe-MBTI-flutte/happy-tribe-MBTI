import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:mbti/main.dart';
import 'package:mbti/resultDrink.dart';
import 'package:mbti/resultTravel.dart';

class result extends StatefulWidget {
  final mbtiResult;
  const result({super.key, this.mbtiResult});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    String mbtiResult = widget.mbtiResult;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber),
              padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Main()));
          },
          child: Text(
            "처음으로 돌아가기",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: FlipCard(
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        side: CardSide.FRONT, // The side to initially display.
        front: resultTravel(
          mbti: mbtiResult,
        ),
        back: resultDrink(),
      ),
    );
  }
}
