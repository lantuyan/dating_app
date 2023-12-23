import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/apis/api.dart';
import 'package:dating_app/helper/dialog.dart';
import 'package:dating_app/helper/my_date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';

import '../models/chat_message.dart';

class MessageCard extends StatefulWidget {
  final ChatMessage message;
  const MessageCard({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    bool isMe = APIs.user.uid == widget.message.fromId;
    return InkWell(
      onLongPress: (){
        _showBottomSheet(isMe);
      },
      child: isMe ? _greenMessage() : _blueMessage(),
    );
  }

  //sender or another user message
  Widget _blueMessage(){
    Size size = MediaQuery.of(context).size;
    //update last read message if sender and receiver are different
    if(widget.message.read.isEmpty){
      APIs.updateMessageReadStatus(widget.message);
      print("message read updated");
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //message content
        Flexible(
          child: Container(
            padding: EdgeInsets.all(widget.message.type == Type.image
                ?size.width * .03
                :size.width * .04
            ),
            margin: EdgeInsets.symmetric(horizontal: size.width * .04, vertical: size.height * .01),
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius:const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                ),
                border: Border.all(color: Colors.lightBlue)
            ),
            child: widget.message.type == Type.text ?
            Text(widget.message.msg, style: TextStyle(color: Colors.black87, fontSize: 15),)
                :   //user profile image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: widget.message.msg,
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(strokeWidth: 2,),
                ),
                errorWidget: (context, url, error) => Icon(Icons.image,size: 70,),
              ),
            ),

          ),
        ),

        //message time
        Padding(
          padding:  EdgeInsets.only(right: size.width * .04),
          child: Text(MyDateUtill.getFormattedTime(context: context, time: widget.message.sent), style: TextStyle(color: Colors.black54, fontSize: 13),),
        ),
      ],
    );
  }

  //our or user message
  Widget _greenMessage(){
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //message time
        Row(
          children: [
            //for adding some space
            SizedBox(width: size.width * .04,),
            //double tick blue icon for message read

            //double tick blue icon for message read
            if(widget.message.read.isNotEmpty)
              const Icon(Icons.done_all_outlined, color: Colors.blue,size: 20,),
            SizedBox(width: 2,),
            //read time
            Text(MyDateUtill.getFormattedTime(context: context, time: widget.message.sent), style: TextStyle(color: Colors.black54, fontSize: 13),),
          ],
        ),
        //message content
        Flexible(
          child: Container(
            padding: EdgeInsets.all(widget.message.type == Type.image
                ?size.width * .03
                :size.width * .04
            ),
            margin: EdgeInsets.symmetric(horizontal: size.width * .04, vertical: size.height * .01),
            decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius:const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
                ),
                border: Border.all(color: Colors.lightGreen)
            ),
            child: widget.message.type == Type.text ?
            Text(widget.message.msg, style: TextStyle(color: Colors.black87, fontSize: 15),)
                :   //user profile image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: widget.message.msg,
                placeholder: (context, url) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(strokeWidth: 2,),
                ),
                errorWidget: (context, url, error) => Icon(Icons.image,size: 70,),
              ),
            ),
          ),
        ),
      ],
    );
  }


  // bottom sheet for picking a profile picture for user
  void _showBottomSheet(bool isMe){
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
        )),
        builder: (_){
          return ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 4,
                margin: EdgeInsets.symmetric(
                    vertical: size.height * .015,
                    horizontal: size.width * .4
                ),
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),),
              widget.message.type == Type.text
              //Copy option
                  ?_OptionItem(
                  icon:const Icon(
                    Icons.copy_all_rounded, color: Colors.blue, size: 26,),
                  name: 'Copy Text',
                  onTap: () async{
                    await Clipboard.setData(ClipboardData(text: widget.message.msg)).then((value){
                      Navigator.pop(context);

                      Dialogs.showSnackbar(context, 'Text Copied!');
                    });
                  }
              )
                  :_OptionItem(
                  icon:const Icon(
                    Icons.download_rounded, color: Colors.blue, size: 26,),
                  name: 'Save Image',
                  onTap: (){
                    try{
                      GallerySaver.saveImage(widget.message.msg, albumName: 'We chat').then((sucess){
                        Navigator.pop(context);
                        if(sucess!=null && sucess){
                          Dialogs.showSnackbar(context, 'Image Successfully Saved !');
                        }

                      });
                    }catch(e){
                      print('ErrorWhileSavingImg: $e');
                    }
                  }
              ),


              //separator or divider
              Divider(
                color: Colors.black54,
                endIndent: size.width * .04,
                indent: size.width * .04,
              ),

              //Edit option
              if(widget.message.type == Type.text && isMe)
                _OptionItem(
                    icon:const Icon(
                      Icons.edit, color: Colors.blue, size: 26,),
                    name: 'Edit messages',
                    onTap: (){
                      Navigator.pop(context);
                      _showMessageUpdateDialog();
                    }
                ),

              //Delete option
              if(isMe)
                _OptionItem(
                    icon:const Icon(
                      Icons.delete, color: Colors.red, size: 26,),
                    name: 'Delete Message',
                    onTap: () async{
                      await APIs.deleteMessage(widget.message).then((value){
                        Navigator.pop(context);
                      });
                    }
                ),

              //separator or divider
              Divider(
                color: Colors.black54,
                endIndent: size.width * .04,
                indent: size.width * .04,
              ),

              //Sent option
              _OptionItem(
                  icon:const Icon(
                    Icons.remove_red_eye, color: Colors.blue, size: 26,),
                  name: 'Send At: ${MyDateUtill.getMessageTime(context: context, time: widget.message.sent)}',
                  onTap: (){}
              ),

              //Read option
              _OptionItem(
                  icon:const Icon(
                    Icons.remove_red_eye, color: Colors.red, size: 26,),
                  name: widget.message.read.isEmpty
                      ? 'Read At: Not seen yet'
                      :'Read At: ${MyDateUtill.getMessageTime(context: context, time: widget.message.read)}',
                  onTap: (){}
              ),

            ],
          );
        });
  }

  //dialog for updating message content
  void _showMessageUpdateDialog(){
    String _updateMsg = widget.message.msg;

    showDialog(context: context, builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      title: Row(
        children: [
          const Icon(Icons.message, color: Colors.blue,size: 28,),
          const Text('Update Message')
        ],
      ),

      //content
      content: TextFormField(
        autofocus: false,
        initialValue: _updateMsg,
        onChanged: (val){
          _updateMsg = val;
        },
        decoration: InputDecoration(border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        )),),
      actions: [
        MaterialButton(onPressed: (){
          Navigator.pop(context);
        },child: Text('Cancel', style: TextStyle(color: Colors.blue, fontSize: 16),),),
        MaterialButton(onPressed: (){
          Navigator.pop(context);
          APIs.updateMessage(widget.message, _updateMsg);

        },child: Text('Update', style: TextStyle(color: Colors.blue, fontSize: 16),),)
      ],
    ),);
  }
}

class _OptionItem extends StatelessWidget {
  final String name;
  final Icon icon;
  final VoidCallback onTap;
  const _OptionItem({Key? key,required this.icon, required this.name,  required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> onTap(),
      child: Padding(
        padding:  EdgeInsets.only(
            left: size.width * .05,
            top: size.height * .015,
            bottom: size.height * .025
        ),
        child: Row(
          children: [
            icon,
            Text('    $name', style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                letterSpacing: 0.5
            ),),
          ],
        ),
      ),
    );
  }
}