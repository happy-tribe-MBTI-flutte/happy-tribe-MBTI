import 'package:flutter/material.dart';

void main() {
  runApp(resultDrink());
}

class resultDrink extends StatelessWidget {
  const resultDrink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assests/page_img/r_img2.png'),
        ),
      ),
      child: Scaffold(backgroundColor: Colors.transparent),
    );
  }
}