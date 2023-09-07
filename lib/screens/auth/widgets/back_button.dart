import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/color_schemes.dart';

class BackToScreenButton extends StatelessWidget {
  final String backRoute;

  const BackToScreenButton({
    super.key,
    required this.backRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: borderColor,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          )),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: redColor,
          size: 20,
        ),
        color: redColor,
        onPressed: () {
          context.go(backRoute);
        },
      ),
    );
  }
}
