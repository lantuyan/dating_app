import 'package:flutter/material.dart';

import '../chat/models/chat.dart';
import '../widgets/back_button.dart';
import 'component/message_chat.dart';
import 'component/message_form.dart';
import 'component/message_mic.dart';
import 'models/chat_message.dart';

class Message extends StatelessWidget {
  final Chat chat;
  const Message({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:  Border.all(
                            color: chat.isActive ? Colors.pinkAccent : Colors.transparent,
                            width: 3
                        )
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(chat.image),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chat.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          if(chat.isActive) Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8,),
                          if(chat.isActive) Text('Online') else Text('Offline'),
                        ],
                      )
                    ],
                  ),

                ],
              ),
              BackToScreenButton(backRoute: '',)
            ],
          ),
          Expanded(
              child: ListView.builder(
                 itemCount: demeChatMessages.length,
                  itemBuilder: (context, index) => MessageChat(
                      message: demeChatMessages[index] as ChatMessage
                  ),
              )
          ),
          Container(
            padding: EdgeInsets.symmetric( vertical: 10),
            decoration: BoxDecoration(

            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                      child: MessageForm()
                  ),
                  const SizedBox(width: 20,),
                  MessageMic()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
