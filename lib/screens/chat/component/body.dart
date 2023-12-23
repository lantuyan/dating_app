import 'package:dating_app/apis/api.dart';
import 'package:dating_app/models/chat_users.dart';
import 'package:dating_app/screens/chat/component/bubblestories.dart';
import 'package:dating_app/screens/message/models/chat_message.dart';
import 'package:dating_app/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<ChatUsers> _lists = [];
  //for storing searched items
  final List<ChatUsers> _searchList = [];
  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();

    //for updating user active status according to lifecycle events
    //resume -- active or online
    //pause  -- inactive or offline
    SystemChannels.lifecycle.setMessageHandler((message) {
      print('Message: $message');

      if (APIs.auth.currentUser != null) {
        if (message.toString().contains('resume')) {
          APIs.updateActiveStatus(true);
        }
        if (message.toString().contains('pause')) {
          APIs.updateActiveStatus(false);
        }
      }

      return Future.value(message);
    });  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: APIs.getAllUser(),
      builder: (context, snapshot) {

        switch(snapshot.connectionState){
        //if data is loading
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(child: CircularProgressIndicator(),);

        //if some or all data is loaded then show it
          case ConnectionState.active:
          case ConnectionState.done:


            final data = snapshot.data?.docs;
            _lists = data?.map((e) => ChatUsers.fromJson(e.data())).toList() ?? [];

            if(_lists.isNotEmpty){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchChat(onChanged: (p0) {

                    },),
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
                      itemCount: _lists.length,
                      itemBuilder: (context, index) => ChatCard(
                        users:  _lists[index],
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
                                  child: Message(users: _lists[index],),
                                ),
                              );
                            },);

                        },
                      ),
                    ))
                  ],
                ),
              );
            }else{
              return Center(
                  child: const Text(
                    "No connections Found! ",
                    style: TextStyle(fontSize: 20),
                  ));
            }
        }
      },
    );
  }
}
