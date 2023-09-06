import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/color_schemes.dart';
import '../../theme/theme.dart';

class IAmScreen extends StatefulWidget {
  const IAmScreen({super.key});

  @override
  State<IAmScreen> createState() => _IAmScreenState();
}

class _IAmScreenState extends State<IAmScreen> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 96),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
            child: AppBar(
              leading: backButton(),
              actions: [
                skipButton(),
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
                  const Text(
                    'I am a ',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: blackColor,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              selectedIndex == 0 ? redColor : whiteColor,
                            ),
                            overlayColor:
                                MaterialStateProperty.all<Color>(redColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Man',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == 0
                                      ? whiteColor
                                      : blackColor,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: selectedIndex == 0
                                    ? whiteColor
                                    : blackColor,
                                size: 20,
                              ),
                            ],
                          )),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              selectedIndex == 1 ? redColor : whiteColor,
                            ),
                            overlayColor:
                                MaterialStateProperty.all<Color>(redColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Woman',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == 1
                                      ? whiteColor
                                      : blackColor,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: selectedIndex == 1
                                    ? whiteColor
                                    : blackColor,
                                size: 20,
                              ),
                            ],
                          )),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              selectedIndex == 2 ? redColor : whiteColor,
                            ),
                            overlayColor:
                                MaterialStateProperty.all<Color>(redColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose another',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: selectedIndex == 2
                                      ? whiteColor
                                      : blackColor,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: selectedIndex == 2
                                    ? whiteColor
                                    : blackColor,
                                size: 20,
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              continueButon(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget skipButton() {
  return TextButton(
    onPressed: () {},
    child: const Text(
      'Skip',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: redColor,
      ),
    ),
  );
}

Widget backButton() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: borderColor,
        border: Border.all(
          color: borderColor,
          width: 2.0,
        )),
    child: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: redColor,
        size: 20,
      ),
      color: redColor,
      onPressed: () {},
    ),
  );
}

Widget continueButon() {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        redColor,
      ),
      overlayColor: MaterialStateProperty.all<Color>(Colors.red),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
    child: const Text(
      'Continue',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
    ),
  );
}
