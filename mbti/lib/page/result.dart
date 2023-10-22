import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:mbti/main.dart';
import 'package:mbti/page/main_page.dart';
import 'package:mbti/page/resultDrink.dart';
import 'package:mbti/page/resultTravel.dart';

class result extends StatefulWidget {
  final mbtiResult;
  const result({super.key, this.mbtiResult});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
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
            backgroundColor: Colors.pink.shade100,
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
          child: Text(
            "처음으로 돌아가기",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          child: FlipCard(
            fill: Fill
                .fillBack, // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL, // default
            side: CardSide.FRONT, // The side to initially display.
            front: resultTravel(
              mbti: mbtiResult,
            ),
            back: resultDrink(mbti: mbtiResult),
          ),
        ),
      ),
    );
  }
}
