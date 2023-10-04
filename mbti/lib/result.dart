import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class result extends StatefulWidget {
  final selectMbti; 
  
  const result({super.key, this.selectMbti});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    String selectMbti = widget.selectMbti;
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.FRONT, // The side to initially display.
      front: Container( color: Colors.red ,child: Text('${selectMbti}')),
      back: Container( color: Colors.blue ),
      autoFlipDuration: const Duration(
          seconds:
              2), // The flip effect will work automatically after the 2 seconds
    );
  }
}
