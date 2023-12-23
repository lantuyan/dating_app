import 'dart:io';

import 'package:dating_app/screens/signup/signup/component/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../apis/api.dart';
import '../../../../navigation/navigation.dart';
import '../../../chat/chat_screen.dart';
import '../../widgets/my_button.dart';
import 'divider.dart';
import 'phone_button.dart';

class Body extends StatefulWidget {
  final TabController tabController;
  const Body({Key? key, required this.tabController}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {


  _handleGoogleBtnClick(){
    _signInWithGoogle().then((users) async {
      //Dialogs.showProgressBar(context);
      if(users != null){
        //Navigator.pop(context);
        print('User: ${users.user}');
        print('User: ${users.additionalUserInfo}');

        if((await APIs.userExists())){
          context.go(NavigationPath.mainScreen);
        } else{
          await APIs.createUser().then((value){
            context.pushReplacement(NavigationPath.mainScreen);
          });
      }
      }
    });
  }
  Future<UserCredential?> _signInWithGoogle() async {
    try{
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    }catch(e){
      print("\n _signInWithGoogle: $e");
      //Dialogs.showSnackbar(context, 'Something went Wrong (Check Internet)');
      return null;
    }
  }
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
               child: MyButton(onTap: (){
                 _handleGoogleBtnClick();
               }, textMy: 'Contiune with email'),
             ),
            const SizedBox(height: 30,),
            PhoneButton(onTap: (){
              widget.tabController.animateTo(widget.tabController.index +1);
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
