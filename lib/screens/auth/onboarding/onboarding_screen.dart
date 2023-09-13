import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../navigation/navigation.dart';
import 'component/body.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(child: Body()),
    );
  }
}
