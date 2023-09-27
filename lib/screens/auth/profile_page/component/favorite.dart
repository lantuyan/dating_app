import 'package:dating_app/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 78,
          width: 78,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
          ),
          child: Icon(Icons.close_rounded, color: Color(0xffF27121),size: 30,),
        ),
        Container(
          height: 99,
          width: 99,
          decoration: BoxDecoration(
              color: redColor,
              shape: BoxShape.circle
          ),
          child: Icon(Icons.favorite, color: Colors.white,size: 51,),
        ),
        Container(
          height: 78,
          width: 78,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.star, color: Color(0xff8A2387),size: 30,),
        ),
      ],
    );
  }
}
