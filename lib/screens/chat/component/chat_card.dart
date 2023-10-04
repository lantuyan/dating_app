import 'package:flutter/material.dart';

import '../../../theme/color_schemes.dart';
import '../models/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  final VoidCallback press;
  const ChatCard({Key? key, required this.chat, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 20 * 0.75),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
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
                    if(chat.isActive) Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 3
                          )
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(chat.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      const SizedBox(height: 8,),
                      Opacity(
                        opacity: 0.64,
                          child: Text(chat.lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,)),
                    ],
                  ),
                )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Opacity(
                        opacity: 0.64,
                        child: Text(chat.time)),
                    const SizedBox(height: 3,),
                    if(chat.numberMessage.isNotEmpty)
                      Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: redColor,
                          shape: BoxShape.circle,
                      ),
                        child: Center(
                            child: Text(chat.numberMessage,style: TextStyle(color: Colors.white),)
                        ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox( width: 50,),
                ),
                Expanded(child: Divider(thickness: 0.5,color: Colors.grey[400],))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
