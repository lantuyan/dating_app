import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'component/body.dart';


class Profile_Page_Screen extends StatelessWidget {
  const Profile_Page_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness  == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: (){},icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text('Profile', style: Theme.of(context).textTheme.headline4,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: Body(),
    );
  }
}
