import 'package:dating_app/screens/message/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageStatusDot extends StatelessWidget {
  final MessageStatus status;
  const MessageStatusDot({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status){
      switch(status){
        case MessageStatus.not_sent:
          return Colors.red;
          break;
        case MessageStatus.not_view:
          return Color(0xff808080);
          break;
        case MessageStatus.viewed:
          return Color(0xffEC586C);
          break;
        default:
          return Color(0xff808080);
      }
    }
    return Icon(
      status == MessageStatus.not_sent ? Icons.close : Icons.done_all_outlined,
      size: 15,
      color: dotColor(status));
  }
}