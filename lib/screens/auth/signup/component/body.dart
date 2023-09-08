import 'package:dating_app/screens/auth/signup/component/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/navigation.dart';
import '../../widgets/my_button.dart';
import 'divider.dart';
import 'phone_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset('assets/icons/tinder.png',height: 100,width: 100,),
             const SizedBox(height: 50,),
             Text('Sign up to continue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: MyButton(onTap: (){}, textMy: 'Contiune with email'),
             ),
            const SizedBox(height: 30,),
            PhoneButton(onTap: (){
              context.go(NavigationPath.numberphone);
            }, textMy: 'Use phone number'),
            const SizedBox(height: 50,),
            //or continue with
            DividerOr(),
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





          ],
        ),
      ),
    );
  }
}
