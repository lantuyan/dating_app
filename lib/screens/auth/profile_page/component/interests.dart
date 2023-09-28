import 'package:flutter/material.dart';

class InterestSelect extends StatefulWidget {
  final String name;
  bool isSelect;
  InterestSelect({ required this.name, required this.isSelect });

  @override
  State<InterestSelect> createState() => _InterestSelectState();
}

class _InterestSelectState extends State<InterestSelect> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.isSelect = !widget.isSelect;
        });

      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: widget.isSelect ? Colors.pinkAccent : Colors.grey, width: 1),
          //color: Colors.yellow
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(widget.isSelect) Icon(Icons.done_all, color: widget.isSelect ? Colors.pinkAccent : Colors.transparent,),
              Text(widget.name, style: TextStyle(color: widget.isSelect ? Colors.pinkAccent : Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
