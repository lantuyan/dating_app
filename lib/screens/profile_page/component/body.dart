import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../theme/color_schemes.dart';
import 'profile_menu.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
          child: Column(
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
                      child: const Icon(LineAwesomeIcons.alternate_pencil, color: Colors.black, size: 20,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Text('Coding with T', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),),
              Text('samtruong@gmail.com', style: TextStyle(color: Colors.black, fontSize: 12, ),),
              const SizedBox(height: 20,),
              SizedBox(
                width: 200,
                height: 50,
                child: MyButton(
                  onTap: (){},
                  textMy: 'Edit Profile',
                ),
              ),
              const SizedBox(height: 30,),
              const Divider(color: Colors.grey,),
              const SizedBox(height: 10,),
              ProfileMenu(title: 'Settings', icon: LineAwesomeIcons.cog, onPress: (){},),
              ProfileMenu(title: 'Billing Details', icon: LineAwesomeIcons.wallet, onPress: (){},),
              ProfileMenu(title: 'User Management',icon: LineAwesomeIcons.user_check,onPress: (){},),
              const Divider(),
              ProfileMenu(title: 'Imformation',icon: LineAwesomeIcons.info,onPress: (){},),
              ProfileMenu(title: 'Logout', icon: LineAwesomeIcons.alternate_sign_out, onPress: (){}, endIcon: false,textColor: Colors.red,)

            ],
          )
      ),
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
              fontSize: 12
          ),),

        ),
      ),
    );
  }
}


