import 'package:dating_app/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class ContentProfile extends StatelessWidget {
  const ContentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jessica Parker, 23', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text('Professional model', style: TextStyle(fontSize: 14, color: Colors.grey[300]),)
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: borderColor,
                    border: Border.all(
                      color: borderColor,
                      width: 2.0,
                    )),
                child: IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: redColor,
                    size: 20,
                  ),
                  color: redColor,
                  onPressed: () {

                  },
                ),
              )
            ],
          ),
          SizedBox(height: 30,),
          Text('My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..'),
          SizedBox(height: 30,),
          Text('My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..'),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
