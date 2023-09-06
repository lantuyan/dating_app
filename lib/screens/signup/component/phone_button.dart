import 'package:flutter/material.dart';

class PhoneButton extends StatelessWidget {
  final String textMy;
  final Function()? onTap;
  const PhoneButton({
    Key? key,
    required this.onTap,
    required this.textMy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(18),
        margin:const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),

        ),
        child: Center(
          child: Text(textMy, style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),),

        ),
      ),
    );
  }
}