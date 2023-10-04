import 'package:dating_app/screens/chat/component/bubblestories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../message/message.dart';
import '../bloc/bloc_bubblestrories.dart';
import '../models/chat.dart';
import '../models/people.dart';
import 'chat_card.dart';
import 'search_chat.dart';

class Body extends StatefulWidget {

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchChat(),
          const SizedBox(height: 10,),
          Text('Activities',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          //STORES
          Container(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataPeoles.length,
              itemBuilder: (context, index) {
                return BubbleStories(people: dataPeoles[index] as People,);
              },),
          ),
          //Stores
          const SizedBox(height: 10,),
          Text('Messages',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10,),
          Expanded(child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index] as Chat,
                press: (){
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Color(0xffFFE8E8),
                      //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                              height: size.height * 0.8,
                              child: Message(chat: chatsData[index] as Chat,),
                          ),
                        );
                      },);
                },
              ),
          ))
        ],
      ),
    );
  }
}
