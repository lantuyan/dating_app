import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/navigation.dart';
import '../../../../theme/color_schemes.dart';
import '../../../signup/phone/auth_screen.dart';
import 'divider_signin.dart';
import 'my_textfiled.dart';
import 'square_tile.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/tinder.png',height: 100,width: 100,),
                  const SizedBox(height: 50,),
                  Text('Sign in to continue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),

                  //username textfield
                  MyTextField(
                    nameHint: 'Enter Phone',
                    nameLabel: 'Phone',
                    obscureText: false,
                  ),
                  const SizedBox(height: 25,),
                  MyTextField(
                    nameHint: 'Enter PassWord',
                    nameLabel: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25,),
                  MyButton(onTap: (){}, textMy: 'Login'),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('First time here ?'),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUpWithPhone()),
                            );
                        },
                        child: const Text('Sign Up', style: TextStyle(color: redColor, fontWeight: FontWeight.w500),),
                      )
                    ],
                  ),
                  const SizedBox(height: 25,),
                  DividerSignIn(),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(imgPath: 'assets/icons/fb.png'),
                      const SizedBox(width: 10,),
                      SquareTile(imgPath: 'assets/icons/google.png'),
                      const SizedBox(width: 10,),
                      SquareTile(imgPath: 'assets/icons/apple-logo.png')
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
                ],
              ),
            ),
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