import 'dart:async';

import 'package:flutter/material.dart';

import 'message_form.dart';
import 'message_mic.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double percent = 0.0;
  //Now let's create the Timer that will auto close the story when it finish
  late Timer _timer;

  void startTimer(){
    _timer = Timer.periodic(Duration(microseconds: 40), (timer) {
      setState(() {
        percent += 0.001;
        if(percent > 1){
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
   // startTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/670720/pexels-photo-670720.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                fit: BoxFit.cover
            ),

          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               children: [
                 LinearProgressIndicator(
                   value: percent,
                   backgroundColor: Colors.white,
                   color: Colors.pink,
                 ),
                 const SizedBox(height: 8,),
                 Row(
                   children: [
                     CircleAvatar(
                       backgroundImage: NetworkImage('https://images.pexels.com/photos/35537/child-children-girl-happy.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                       radius: 30,
                     ),
                     const SizedBox(width: 10,),
                     Text("Tony", style: TextStyle(color: Colors.white, fontSize: 18),)
                   ],
                 )
               ],
             ),

              Row(
                children: [
                  Expanded(
                      child: MessageForm()
                  ),
                  const SizedBox(width: 20,),
                  MessageMic()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
