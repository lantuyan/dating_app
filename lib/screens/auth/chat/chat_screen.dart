import 'package:flutter/material.dart';
import '../widgets/back_button.dart';
import 'component/body.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 40, top: 40),
          child: AppBar(
             title: Text('Messages',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            actions: const [
              BackToScreenButton(backRoute: '')
            ],
          ),
        ),
      ),
      body:Body(),
    );
  }
}
