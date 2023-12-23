import 'package:flutter/material.dart';

class DividerSignIn extends StatelessWidget {
  const DividerSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 0.8,color: Colors.grey[700],)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('or continue with', style: TextStyle(color: Colors.black),),
        ),
        Expanded(child: Divider(thickness: 0.8,color: Colors.grey[700],))
      ],
    );
  }
}
