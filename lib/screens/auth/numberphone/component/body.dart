import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../navigation/navigation.dart';
import '../../widgets/my_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My mobile', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
              Text('Please enter your valid phone number. We will send you a 4-digit code to verify your account.',
                  style: GoogleFonts.inder(),
                  maxLines: 2,
              ),
              const SizedBox(height: 30,),

              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                    ),
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),

              const SizedBox(height: 30,),

              MyButton(onTap: (){
                context.go(NavigationPath.code);
              }, textMy: 'Continue'),
            ],
          ),
        ));
  }
}