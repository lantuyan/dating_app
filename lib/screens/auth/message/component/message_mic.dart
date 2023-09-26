import 'package:flutter/material.dart';

import '../../../../theme/color_schemes.dart';

class MessageMic extends StatelessWidget {
  const MessageMic({Key? key}) : super(key: key);

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
      child: IconButton(
        icon: const Icon(
          Icons.mic_sharp,
          color: redColor,
          size: 25,
        ),
        color: redColor,
        onPressed: () {
        },
      ),
    );
  }
}
