import 'package:flutter/material.dart';

import 'component/body.dart';

class SignUpScreen extends StatelessWidget {
  final TabController tabController;
  const SignUpScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        tabController: tabController,
      ),
    );
  }
}
