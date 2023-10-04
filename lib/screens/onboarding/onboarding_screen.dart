import 'package:flutter/material.dart';
import 'component/body.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(0, 96),
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 40),
          ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Body(),
      ),
    );
  }
}
