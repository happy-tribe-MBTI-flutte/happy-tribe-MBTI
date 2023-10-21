import 'package:flutter/material.dart';

import '../model/mbti_travel.dart';

class TravelImgSlider extends StatefulWidget {
  final MbtiTravel futureDate; // futureImage 변수의 타입을 명시적으로 지정
  TravelImgSlider({Key? key, required this.futureDate})
      : super(key: key); // 생성자 수정

  @override
  _TravelImgSliderState createState() => _TravelImgSliderState();
}

class _TravelImgSliderState extends State<TravelImgSlider> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(),
      itemCount: widget.futureDate.img.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(index == 0 ?  widget.futureDate.Overseas :widget.futureDate.Domestic ,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            Image(
              fit: BoxFit.cover,
              height: 190,
              width: double.infinity,
              image: AssetImage(widget.futureDate.img[index]),
            ),
          ],
        );
      },
    );
  }
}
