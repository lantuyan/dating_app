import 'package:flutter/material.dart';
import '../widgets/skip_button.dart';
import 'component/body.dart';
import '../../../navigation/navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 96),
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
          child: AppBar(
            actions: const [
              SkipButton( nextRoute: NavigationPath.genderScreen),
            ],
          ),
        ),
      ),
      body:Body(),
    );
  }
}
