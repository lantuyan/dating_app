import 'package:flutter/material.dart';

import '../../../navigation/navigation.dart';
import '../../../theme/color_schemes.dart';
import '../widgets/widgets.dart';
import 'model/passion.dart';
import 'select_passion.dart';

class PassionScreen extends StatelessWidget {
  const PassionScreen({
    super.key,    
  });
  
  @override
  Widget build(BuildContext context) {
    final passionList = fakeInterests;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 96),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
            child: AppBar(
              leading: const BackToScreenButton(
                backRoute: NavigationPath.genderScreen
              ),
              actions: const [
                SkipButton( nextRoute: NavigationPath.friendScreen),
              ],
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 40),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'I am a ',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  const Text(
                    'Select a few of your interests and let everyone know what'
                    ' you are passionate about.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                      letterSpacing: 0.5,
                      wordSpacing: 0.5,
                    ),
                    textAlign: TextAlign.justify,

                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: passionList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 50,
                    ),
                    itemBuilder: (context, index) {
                      return SelectPassionButton(
                        passion: passionList[index].name,
                        icon: passionList[index].icon,
                        isSelected: passionList[index].selected,
                      );
                    },
                  ),
                ],
              ),
              // continueButon(),
              const ConfirmButton(
                nextRoute: NavigationPath.friendScreen, 
                labelButton: 'Continue',
              ),
            ],
          ),
        ),
      );
  }
}
