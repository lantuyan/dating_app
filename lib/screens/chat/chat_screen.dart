import 'package:dating_app/models/chat_users.dart';
import 'package:flutter/material.dart';
import '../../apis/api.dart';
import '../../theme/color_schemes.dart';
import 'component/body.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 40, top: 40),
          child: AppBar(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 0,
             title: Text('Messages',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            actions: const [
              FilterButton(),
            ],
          ),
        ),
      ),
      body:Body(),
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
