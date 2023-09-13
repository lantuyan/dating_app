import 'package:flutter/material.dart';

class ProfileForm extends StatelessWidget {
  final String nameLabel;
  final String nameHint;
  const ProfileForm({Key? key,required this.nameLabel, required this.nameHint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: nameLabel,
        labelStyle: TextStyle(fontSize: 22),
        hintText: nameHint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 28,
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
