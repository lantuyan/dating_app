import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Indicator extends StatelessWidget {
  final PageController pageController;
  const Indicator({Key? key , required this.pageController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: JumpingDotEffect(
          activeDotColor: Colors.pinkAccent,//mau duong chay
          dotColor: Colors.deepPurple.shade100,// mau dot
          dotHeight: 10,// chiu cao
          dotWidth: 10,//chiu rong
          spacing: 10,//khoang cach
          // verticalOffset: 10
        ),
      ),
    );
  }
}
