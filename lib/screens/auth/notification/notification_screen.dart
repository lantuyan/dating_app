import 'package:flutter/material.dart';

import '../../../navigation/navigation.dart';
import '../../../theme/color_schemes.dart';
import '../widgets/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 96),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
            child: AppBar(
              // leading: const BackToScreenButton(
              //   backRoute: NavigationPath.genderScreen
              // ),
              actions: const [
                SkipButton( nextRoute: NavigationPath.notificationScreen),
              ],
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 40),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 SizedBox(
                   height: MediaQuery.of(context).size.height * 0.4,
                   child: Image(
                      image: const AssetImage(
                        'assets/images/chat_image.jpg',
                      ),
                      fit: BoxFit.fitWidth,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return child;
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                 ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enable notification\'s',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Get push-notification when you get the match or receive a message',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
              
                ],
              ),
              
              // continueButon(),
              const ConfirmButton(
                nextRoute: NavigationPath.mainScreen, 
                labelButton: 'T want to be notified',
              ),
            ],
          ),
        ),
      );
  }
}