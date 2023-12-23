import 'package:flutter/material.dart';

import '../../../../theme/color_schemes.dart';


// ignore: must_be_immutable
class SelectPassionButton extends StatefulWidget {
  final String passion;
  final IconData icon;
  bool isSelected;
  SelectPassionButton({
    super.key,
    required this.passion,
    required this.icon,
    required this.isSelected,
  });

  @override
  State<SelectPassionButton> createState() => _SelectPassionButtonState();
}

class _SelectPassionButtonState extends State<SelectPassionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
         widget.isSelected = !widget.isSelected;
        });
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.fromLTRB(10, 14, 0, 14)),
        backgroundColor: MaterialStateProperty.all<Color>(
          widget.isSelected ? redColor : whiteColor,
        ),
        // overlayColor: MaterialStateProperty.all<Color>(Colors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            widget.icon,
            color: widget.isSelected ? whiteColor : blackColor ,
          ),
          const SizedBox(width: 10),
          Text(
            widget.passion,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: widget.isSelected ? whiteColor : blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
