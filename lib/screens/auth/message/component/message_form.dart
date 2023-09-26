import 'package:dating_app/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class MessageForm extends StatelessWidget {
  const MessageForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          hintText: 'Your message',
          hintStyle: TextStyle(fontSize: 14),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor,),
              borderRadius: BorderRadius.circular(20)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
              borderRadius: BorderRadius.circular(20)
          ),
        suffixIcon: Image.asset('assets/icons/Stroke.png')
      ),
    );
  }
}
