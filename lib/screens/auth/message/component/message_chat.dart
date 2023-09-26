import 'package:dating_app/screens/auth/message/component/audio_message.dart';
import 'package:dating_app/screens/auth/message/component/text_message.dart';
import 'package:dating_app/screens/auth/message/component/video_message.dart';
import 'package:flutter/material.dart';

import '../models/chat_message.dart';
import 'time_message.dart';

class MessageChat extends StatelessWidget {
  final ChatMessage message;
  const MessageChat({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message){
      switch(message.messageType){
        case ChatMessageType.text:
          return TextMessage(message: message );
          break;
        case ChatMessageType.audio:
          return AudioMessage(message:  message,);
          break;
        case ChatMessageType.video:
          return VideoMessage();
          break;
        default:
            return SizedBox();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              messageContaint(message)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              TimeMessage(message: message)
            ],
          ),
        ),

      ],
    );
  }
}



