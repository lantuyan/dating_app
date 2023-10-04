import 'package:flutter/material.dart';

import '../models/chat_message.dart';

class TextMessage extends StatelessWidget {
  final ChatMessage message;
  const TextMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20 * 0.75, vertical: 20 /2),
        decoration: BoxDecoration(
            color: message.isSender ? Color(0xffF3F3F3):Color(0xffFDF2F3),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(message.isSender ? 0 : 10),
                bottomLeft: Radius.circular(message.isSender ? 10 : 0)
            )
        ),
        child: Text(message.text,
          style: TextStyle(),
        )
    );
  }
}
