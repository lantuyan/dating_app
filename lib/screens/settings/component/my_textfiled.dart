import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String nameLabel;

  final IconData icon;
  final bool obscureText;
  const MyTextField({Key? key,required this.nameLabel, required this.icon, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(nameLabel),
        labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 24,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            gapPadding: 10
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            gapPadding: 10
        ),
        prefixIcon: Icon(icon),
      ),

    );
  }
}
