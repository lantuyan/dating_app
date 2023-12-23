import 'package:dating_app/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class MessageForm extends StatelessWidget {
  final controller ;
  final Function()? onPressEmoji;
  final Function()? onPressField;
  final Function()? onPressImg;
  final Function()? onPressCamera;
  const MessageForm({
    required this.controller,
    required this.onPressEmoji,
    required this.onPressField,
    required this.onPressImg,
    required this.onPressCamera,}) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //emoji button
        IconButton(
          onPressed: onPressEmoji,
          icon: const Icon(
            Icons.emoji_emotions,
            color: Colors.blueAccent,
          ),
        ),
        //Text field
        Expanded(child: TextField(
          controller: controller as TextEditingController,
          keyboardType: TextInputType.multiline,
          onTap: onPressField,
          maxLines: null,
          decoration: const InputDecoration(
            hintText: 'Type Something...',
            hintStyle: TextStyle(color: Colors.blueAccent),
            border: InputBorder.none,
          ),
        )),

        //pick image from gallery button
        IconButton(
          onPressed: onPressImg,
          icon: const Icon(
            Icons.image,
            color: Colors.blueAccent,
          ),
        ),
        //take image from camera button
        IconButton(
          onPressed: onPressCamera,
          icon: const Icon(
            Icons.camera,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
