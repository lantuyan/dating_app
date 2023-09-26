import 'package:flutter/material.dart';

import '../../../theme/color_schemes.dart';

class ChoiceButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final IconData icon;
  final double size;
  final Color iconColor;
  final VoidCallback onPressed;

  const ChoiceButton({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.icon,
    required this.size,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
        color: redColor,
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}