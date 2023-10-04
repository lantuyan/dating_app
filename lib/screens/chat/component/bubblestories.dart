import 'package:flutter/material.dart';

import '../models/people.dart';

class BubbleStories extends StatelessWidget {
  final People people;
  const BubbleStories({Key? key, required this.people}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:  Border.all(
                    color: people.isActive ? Colors.pinkAccent : Colors.transparent,
                    width: 3
                )
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(people.image),
            ),
          ),
          const SizedBox(height: 10,),
          Text(people.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
        ],
      ),

    );
  }
}