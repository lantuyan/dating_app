import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/apis/api.dart';
import 'package:dating_app/helper/my_date_util.dart';
import 'package:dating_app/models/chat_users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/color_schemes.dart';
import '../../message/models/chat_message.dart';
import '../models/chat.dart';

class ChatCard extends StatefulWidget {
  final ChatUsers users;
  final Function()? press;
  const ChatCard({Key? key, required this.users, required this.press}) : super(key: key);

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  ChatMessage? _message;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: size.width * .04, vertical: 4),
      color: Colors.blue.shade100,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
       onTap: widget.press ,
        child: StreamBuilder(
          stream: APIs.getLastMessage(widget.users),
          builder: (context, snapshot) {

            final data = snapshot.data?.docs;
            final lists = data?.map((e) => ChatMessage.fromJson(e.data())).toList() ?? [];
            if(lists.isNotEmpty) _message = lists[0];


            return ListTile(
              //leading: CircleAvatar(child: Icon(CupertinoIcons.person),),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(size.height * .3),
                child: CachedNetworkImage(
                  width: size.height * .055,
                  height: size.height * .055,
                  imageUrl: widget.users.image,
                  // placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const CircleAvatar(child: Icon(CupertinoIcons.person)),
                ),
              ),
              title: Text(widget.users.name),
              subtitle: Text(
                _message != null
                    ?_message!.type == Type.image
                    ? 'image'
                    :_message!.msg
                    : widget.users.about,
                maxLines: 1,),
              trailing: _message == null
                  ? null // show nothing when no message is sent
                  : _message!.read.isEmpty &&
                  _message!.fromId != APIs.user.uid
                  ?
              //show for unread message
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: BorderRadius.circular(10)
                ),
              ):
              Text(MyDateUtill.getLastMessageTime(context: context, time: _message!.sent), style: const TextStyle(color: Colors.black),),
            );
          },
        ),
      ),
    );
  }
}
