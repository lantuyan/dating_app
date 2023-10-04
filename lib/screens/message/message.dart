import 'package:flutter/material.dart';

import '../../theme/color_schemes.dart';
import '../chat/models/chat.dart';
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
              FilterButton()
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

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

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
          Icons.keyboard_double_arrow_down,
          color: redColor,
          size: 20,
        ),
        color: redColor,
        onPressed: () {},
      ),
    );
  }
}
