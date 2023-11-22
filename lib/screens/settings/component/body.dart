import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'my_textfiled.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: 120,
                      width: 120,
                      child:  ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: AssetImage('assets/images/girl1.jpg'),
                          fit: BoxFit.fill,
                        ),
                      )
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.pink
                      ),
                      child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50,),
              Column(
                children: [
                  MyTextField(nameLabel: 'FullName',icon: LineAwesomeIcons.person_entering_booth,obscureText: false,),
                  const SizedBox(height: 20,),
                  MyTextField(nameLabel: 'Email',icon: LineAwesomeIcons.mail_bulk,obscureText: false,),
                  const SizedBox(height: 20,),
                  MyTextField(nameLabel: 'Phone',icon: LineAwesomeIcons.phone,obscureText: false,),
                  const SizedBox(height: 20,),
                  MyTextField(nameLabel: 'Location',icon: LineAwesomeIcons.location_arrow,obscureText: true,),
                  SizedBox(height: 20,),
                  MyTextField(nameLabel: 'Password',icon: LineAwesomeIcons.user_secret,obscureText: true,),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: MyButton(
                      onTap: (){},
                      textMy: "Save",
                    ),
                  )

                ],
              ),
            ],
          ),
        )
    );
  }
}

class MyButton extends StatelessWidget {
  final String textMy;
  final Function()? onTap;
  const MyButton({
    Key? key,
    required this.onTap,
    required this.textMy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(18),
        margin:const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Color(0xffE94057),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(textMy, style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
          ),),

        ),
      ),
    );
  }
}

