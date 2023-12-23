import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/apis/api.dart';
import 'package:dating_app/helper/my_date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/chat_users.dart';
import '../../theme/color_schemes.dart';
import 'component/emoji_show.dart';
import 'component/message_chat.dart';
import 'component/message_form.dart';
import 'component/message_mic.dart';
import 'models/chat_message.dart';

class Message extends StatefulWidget {
  final ChatUsers users;
  const Message({Key? key, required this.users}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  //for storing all message
  List<ChatMessage> _lists = [];

  //for handing message text changes
  final _textController = TextEditingController();

  //for storing value of showing or hiding emoji
  bool _showEmoji = false;
  //for checking if image is uploading or not?
  bool _isUploading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: (){
          if(_showEmoji){
            setState(() {
              _showEmoji = !_showEmoji;
            });
            return Future.value(false);
          } else{
            return Future.value(true);
          }
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20),
          child: Column(
            children: [
              StreamBuilder(
                  stream: APIs.getUserInfo(widget.users),
                  builder: (context, snapshot) {
                    final data = snapshot.data?.docs;
                    final lists =
                        data?.map((e) => ChatUsers.fromJson(e.data())).toList() ?? [];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:  Border.all(
                                      color: widget.users.isOnline ? Colors.pinkAccent : Colors.transparent,
                                      width: 3
                                  )
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(size.height * .3),
                                child: CachedNetworkImage(
                                  width: size.height * .055,
                                  height: size.height * .055,
                                  imageUrl: lists.isNotEmpty ? lists[0].image : widget.users.image,
                                  // placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const CircleAvatar(child: Icon(CupertinoIcons.person)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(lists.isNotEmpty ? lists[0].name : widget.users.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                //for adding some space
                                const SizedBox(height: 2,),

                                Text(
                                  lists.isNotEmpty
                                      ? lists[0].isOnline
                                      ? 'Online'
                                      : MyDateUtill.getLastActiveTime(context: context, lastActive: lists[0].lastActive)
                                      :  MyDateUtill.getLastActiveTime(context: context, lastActive: widget.users.lastActive),
                                  style:const TextStyle(
                                      fontSize: 13, color: Colors.black54),)
                              ],
                            ),

                          ],
                        ),
                        FilterButton()
                      ],
                    );
                  },
              ),
              Expanded(
                child: StreamBuilder(
                  stream: APIs.getAllMessage(widget.users),
                  builder: (context, snapshot) {

                    switch(snapshot.connectionState){
                    //if data is loading
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return const SizedBox();


                    //if some or all data is loaded then show it
                      case ConnectionState.active:
                      case ConnectionState.done:
                        final data = snapshot.data?.docs;
                        _lists = data?.map((e) => ChatMessage.fromJson(e.data())).toList() ?? [];


                        if(_lists.isNotEmpty){
                          return ListView.builder(
                            itemCount: _lists.length,
                            padding: EdgeInsets.only(top: size.height * .01),
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return MessageCard(message: _lists[index],);
                            },
                          );
                        }else{
                          return Center(
                              child: const Text(
                                "Say Hi! 👋 ",
                                style: TextStyle(fontSize: 20),
                              ));
                        }
                    }
                  },
                ),
              ),
              //progress indicator for showing uploading
              if(_isUploading)
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: CircularProgressIndicator(strokeWidth: 2,),
                  ),
                ),
              _chatInput(),
              //show emojis on keyboard emoji button click & vice versa
              if(_showEmoji)
                EmojiShow(textControler: _textController)
            ],
          ),
        ),
      ),
    );
  }

  //bottom chat input field
  Widget _chatInput(){

    return Container(
      padding: EdgeInsets.symmetric( vertical: 10),
      decoration: BoxDecoration(

      ),
      //child: _chatInput(),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
                child: Card(
                    child: MessageForm(
                      controller: _textController,
                      onPressEmoji: () {
                        FocusScope.of(context).unfocus();
                        setState(() => _showEmoji = !_showEmoji);
                      }, onPressField: () {
                      if(_showEmoji) setState(() => _showEmoji = !_showEmoji);
                    },
                      onPressCamera: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 70);
                        if(image !=null){
                          setState(() => _isUploading = true);
                          print('Image Path: ${image.path} -- MineType: ${image.mimeType}');
                          await APIs.sendChatImage(widget.users,File(image.path));
                          setState(() => _isUploading = false);

                        }
                      },
                      onPressImg: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick multiple image
                        final List<XFile> images =
                        await picker.pickMultiImage(imageQuality: 70);

                        //uploading & sending image one by one
                        for (var i in images) {
                          setState(() => _isUploading = true);
                          await APIs.sendChatImage(widget.users,File(i.path));
                          setState(() => _isUploading = false);
                        }

                      },
                    )
                )
            ),
            const SizedBox(width: 20,),
            MaterialButton(
              onPressed: (){
                if (_textController.text.isNotEmpty){
                  APIs.sendMessage(widget.users, _textController.text,Type.text);
                  _textController.text = '';
                }
              },
              minWidth: 0,
              color: Colors.lightGreen,
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
              child: Icon(Icons.send, color: Colors.white, size: 28,),
            )
          ],
        ),
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
