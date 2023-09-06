import 'package:flutter/material.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 0.8,color: Colors.grey[700],)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('or continue with', style: TextStyle(color: Colors.black),),
          ),
          Expanded(child: Divider(thickness: 0.8,color: Colors.grey[700],))
        ],
      ),
    );
  }
}
