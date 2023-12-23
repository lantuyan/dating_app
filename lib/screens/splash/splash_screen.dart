import 'package:dating_app/apis/api.dart';
import 'package:dating_app/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      //exit full screen
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      // SystemChrome.setSystemUIOverlayStyle(
      //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
      // );
      if(APIs.auth.currentUser != null){
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const HomeScreen()));
        context.go(NavigationPath.mainScreen);
      }else{
        context.go(NavigationPath.onboardingScreen);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: mq.height * .15,
              right: mq.width * .25,
              width: mq.width * .5,
              child:Image.asset("assets/icons/tinder.png")
          ),
          Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: const Text(
              "MADE IN VIET NAM WITH ❤",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  letterSpacing: .5
              ),
            ),
          )
        ],
      ),
    );
  }
}