import 'package:flutter/material.dart';

import 'component/body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 60),
        child: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          // leading: backButton(),
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back, color: Colors.pinkAccent,),
          ),

        ),
      ),
      body: Body(),
    );
  }
}
