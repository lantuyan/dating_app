import 'package:flutter/material.dart';

class Background_Img extends StatelessWidget {
  const Background_Img({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/human2.jpg"), fit: BoxFit.cover
        )
      ),
    );
  }
}
