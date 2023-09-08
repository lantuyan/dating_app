import 'package:flutter/material.dart';

import 'component/body.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Container(
             margin: EdgeInsets.only(left: 30),
           // padding: EdgeInsets.symmetric(horizontal: 30),
           width: 58,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade400)
            ),
            child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.pink,)
        ),
      ),
      body: Body(),
    );
  }
}
