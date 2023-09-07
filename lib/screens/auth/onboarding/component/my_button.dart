import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String textMy;
  final Function()? onTap;
  const MyButton({
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
            color: Colors.pink,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(textMy, style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),),

        ),
      ),
    );
  }
}