import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../navigation/navigation.dart';
import 'component/body.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Body()),
    );
  }
}
