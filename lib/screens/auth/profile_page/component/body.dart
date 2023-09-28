import 'package:flutter/material.dart';

import '../../../../theme/color_schemes.dart';
import 'background_img.dart';
import 'content_profile.dart';
import 'favorite.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Background_Img(),
              Container(
                //height: 500,
                width: size.width,
                margin: EdgeInsets.only(top: size.height * 0.45),
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                   // color: Colors.pinkAccent,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: ContentProfile(),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(top: size.height * 0.37, left:  10, right: 10
                ),
                decoration: BoxDecoration(
                 // color: Colors.yellow
                ),
                child: Favorite(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
