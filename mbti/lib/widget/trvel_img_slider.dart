import 'dart:async';

import 'package:flutter/material.dart';

import '../model/mbti_travel.dart';

class TravelImgSlider extends StatefulWidget {
  final MbtiTravel futureDate; // futureImage 변수의 타입을 명시적으로 지정
  const TravelImgSlider({Key? key, required this.futureDate})
      : super(key: key); // 생성자 수정

  @override
  _TravelImgSliderState createState() => _TravelImgSliderState();
}

class _TravelImgSliderState extends State<TravelImgSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // 1초 간격으로 페이지를 자동으로 슬라이드하기 위한 타이머 설정
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < widget.futureDate.img.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.futureDate.img.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  index == 0
                      ? widget.futureDate.Overseas
                      : widget.futureDate.Domestic,
                  style: const TextStyle(
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
