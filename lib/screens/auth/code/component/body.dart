import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../navigation/navigation.dart';
import 'keyboard.dart';
import 'number_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final keys = [
    ['1','2','3'],
    ['4','5','6'],
    ['7','8','9'],
    [' ','0',Icon(Icons.keyboard_backspace)],
  ];

  List<Widget> renderKeyBoard(){
    return keys.map((x) => Row(
      children: x.map((y){
        return Expanded(
          child: KeyBoard(
            label: y,
            value: y,
            onTap: (value) {

            },),
        );
      }).toList(),
    ),
    ).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('00:42', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text('Type the verification code weve sent you',
                style: GoogleFonts.openSans(fontSize: 16),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 30,),
            NumberField(),
            const SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                ...renderKeyBoard(),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white
                          ),
                          onPressed: (){
                            context.go(NavigationPath.profile);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('Send again', style: TextStyle(color: Colors.pinkAccent),),
                          ),
                        ))
                  ],
                ),
              ]
            )

          ],
        ),
      ),
    );
  }
}
