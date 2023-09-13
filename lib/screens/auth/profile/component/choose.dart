import 'package:flutter/material.dart';
import '../../../../theme/color_schemes.dart';


class ButtonChoose extends StatelessWidget {
  final String textMy;
  final Function()? onTap;
  const ButtonChoose({
    Key? key,
    required this.onTap,
    required this.textMy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
            color: Color(0xffFDECEE),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Icon(Icons.calendar_month_rounded, color: redColor,),
              const SizedBox(width: 10,),
              Text('Choose birthday date', style: TextStyle(color: redColor, fontSize: 16, fontWeight: FontWeight.bold),)
            ],
          ),
        )
      ),
    );
  }
}