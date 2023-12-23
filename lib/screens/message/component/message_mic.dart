import 'package:flutter/material.dart';

import '../../../theme/color_schemes.dart';

class MessageSent extends StatelessWidget {
  final VoidCallback onPress;
  const MessageSent({Key? key, required this.onPress, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: borderColor,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          )),
      child: MaterialButton(
        onPressed: () =>onPress,
        minWidth: 0,
        color: Colors.lightGreen,
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
        child: Icon(Icons.send, color: Colors.white, size: 28,),
      ),
    );
  }
}
