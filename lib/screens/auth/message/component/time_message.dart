import 'package:dating_app/screens/auth/message/component/dot_message_status.dart';
import 'package:dating_app/screens/auth/message/models/chat_message.dart';
import 'package:flutter/material.dart';

class TimeMessage extends StatelessWidget {
  final ChatMessage message;
  const TimeMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(message.time),
        const SizedBox(width: 8,),
        if(message.isSender) MessageStatusDot(status: message.messageStatus as MessageStatus,)
      ],
    );
  }
}

