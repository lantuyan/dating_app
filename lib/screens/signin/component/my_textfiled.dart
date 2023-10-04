import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String nameLabel;
  final String nameHint;
  final bool obscureText;
  const MyTextField({Key? key,required this.nameLabel, required this.nameHint, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: nameLabel,
        labelStyle: TextStyle(fontSize: 22, color: Colors.black),
        hintText: nameHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 24,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 10
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 10
        ),
      ),

    );
  }
}
