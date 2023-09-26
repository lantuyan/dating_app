import 'package:flutter/material.dart';

import '../../../theme/color_schemes.dart';

class SkipButton extends StatelessWidget {
  final TabController tabController;
  const SkipButton({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context, ) {
    return TextButton(
      onPressed: () {
        tabController.animateTo(tabController.index + 1);
        // Navigator.pushNamed(context, nextRoute);
      },
     child: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: redColor,
        ),
      ),
    );
  }
}