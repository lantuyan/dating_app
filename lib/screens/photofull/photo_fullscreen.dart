import 'package:dating_app/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'component/body.dart';

class PhotoFullScreen extends StatelessWidget {
  const PhotoFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(0, 96),
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40,top:40),
              child: AppBar(
                leading: const BackToScreenButton(backRoute: ''),
              ),
            ),
          ),
          body: Body(),
        );
  }
}
class BackToScreenButton extends StatelessWidget {
  final String backRoute;

  const BackToScreenButton({
    super.key,
    required this.backRoute,
  });

  @override
  Widget build(BuildContext context) {
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
          color: Color(0xffE94057),
          size: 20,
        ),
        color: whiteColor,
        onPressed: () {
          context.go(backRoute);
        },
      ),
    );
  }
}