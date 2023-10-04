import 'package:flutter/material.dart';

import '../models/chat_message.dart';

class AudioMessage extends StatelessWidget {
  final ChatMessage message;
  const AudioMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      padding: EdgeInsets.symmetric(
        horizontal: 20 * 0.75,
        vertical: 20 / 2.5
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: message.isSender ? Color(0xffF3F3F3):Color(0xffFDF2F3),
      ),
      child: Row(
        children: [
          Icon(Icons.play_arrow, color: message.isSender ? Color(0xff4A4739) : Color(0xffE94057),),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 2,
                  color: message.isSender ? Colors.white : Color(0xffE94057).withOpacity(0.4),
                ),
                Positioned(
                  left: 0,
                  child: Container(height: 8, width: 8, decoration: BoxDecoration(
                    color: message.isSender ? Colors.white : Color(0xffE94057),
                    shape: BoxShape.circle
                  ),),
                )
              ],
            ),
          )),
          Text('0.37',
          style: TextStyle(fontSize: 12, color: message.isSender ? Colors.white : null),)
        ],
      ),
    );
  }
}
