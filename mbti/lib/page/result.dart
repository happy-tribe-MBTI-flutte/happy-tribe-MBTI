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

class _ResultState extends State<Result> with SingleTickerProviderStateMixin {
  bool a = true;

  @override
  void dispose() {
    super.dispose();
  }

  late AnimationController controller;
  double position = 0.5;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    Animation<double> animation =
        Tween(begin: 0.0, end: 1.1).animate(controller);

    animation.addListener(() {
      setState(() {
        position = animation.value;
      });
    });

    // 애니메이션을 한 번만 실행하려면 controller를 특정 지점에서 멈추도록 설정
    controller.forward().whenComplete(() {
      controller.stop();
    });
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
            front: Stack(children: [
              ResultTravel(
                mbti: mbtiResult,
              ),
              Positioned(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          position - 0.1,
                          position,
                          position + 0.1,
                          position + 0.1,
                        ],
                        colors: [
                          const Color.fromARGB(0, 255, 255, 255),
                          Color.fromARGB(255, 255, 251, 45),
                          Color.fromARGB(183, 255, 225, 56),
                          Color.fromARGB(183, 255, 255, 255),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
            back: ResultDrink(mbti: mbtiResult),
          ),
        ),
      ),
    );
  }
}
