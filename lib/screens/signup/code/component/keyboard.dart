import 'package:flutter/material.dart';

class KeyBoard extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;
  const KeyBoard({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {

  renderLabel(){
    if(widget.label is Widget){
      return widget.label;
    }
    return Text(
      widget.label.toString(),
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: Container(
          child: Center(
            child: renderLabel() as Widget,
          ),
        ),
      ),
    );
  }
}
