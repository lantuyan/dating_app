import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/color_schemes.dart';

class SkipButton extends StatelessWidget {
  final String nextRoute;
  const SkipButton({
    super.key,
    required this.nextRoute,
  });

  @override
  Widget build(BuildContext context, ) {
    return TextButton(
      onPressed: () {
        context.go(nextRoute);
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