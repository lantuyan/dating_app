import 'package:flutter/material.dart';

import 'background_img.dart';

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
                height: 500,
                margin: EdgeInsets.only(top: size.height * 0.45),
                decoration: BoxDecoration(
                  color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)
                    )
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(top: size.height * 0.4, left:  10, right: 10
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
