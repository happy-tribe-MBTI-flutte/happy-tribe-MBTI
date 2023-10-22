import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiagonalLightEffect(),
    );
  }
}

class DiagonalLightEffect extends StatefulWidget {
  @override
  _DiagonalLightEffectState createState() => _DiagonalLightEffectState();
}

class _DiagonalLightEffectState extends State<DiagonalLightEffect>
    with SingleTickerProviderStateMixin {
  // Use SingleTickerProviderStateMixin

  double position = 1.0; // Position of the light effect (0.0 to 1.0)

  @override
  void initState() {
    super.initState();

    // Create an animation to move the light effect diagonally
    AnimationController controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // You can adjust the duration
    );

    Animation<double> animation =
        Tween(begin: 0.0, end: 1.1).animate(controller);

    animation.addListener(() {
      setState(() {
        position = animation.value;
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 370,
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [position - 0.1, position, position + 0.1],
              colors: [
                Color.fromARGB(228, 255, 231, 98), // Use the custom gold color here
                Colors.yellowAccent.shade100,
                Color.fromARGB(255, 255, 231, 98),
              ],
            ),
          ),
          child: Text('asdasd'),
        ),
      ),
    );
  }
}
