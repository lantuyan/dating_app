import 'package:dating_app/screens/onboarding/component/page_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/card_page.dart';
import 'dart:math' as math;

import 'indicator.dart';
import 'my_button.dart';


class CardCarouse extends StatefulWidget {
  const CardCarouse({Key? key}) : super(key: key);

  @override
  State<CardCarouse> createState() => _CardCarouseState();
}

class _CardCarouseState extends State<CardCarouse> {
  late PageController _pageController;
  int initialPage = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      // so that we can have small portion shown on left and right side
    viewportFraction: 0.7,
      // by default our poster
    initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      initialPage = value;
                    });
                  },
                  controller: _pageController,
                  itemCount: cardpages.length,
                  itemBuilder: (context, index) {
                    var card = cardpages[index];
                    var _scale = initialPage == index ? 1.0 : 0.8;
                    return TweenAnimationBuilder(
                        tween: Tween(begin: _scale , end: _scale),
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.ease,
                        child: PageCard(cardPage: card,),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },);
                  }

              ),
          ),
        ),

       Indicator(pageController: _pageController),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10),
         child: MyButton(textMy: 'Create an account',onTap: (){}),
       ),

       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('Already have an account?'),
           Text('Sign In', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),)
         ],
       )
      ],
    );
  }


}


