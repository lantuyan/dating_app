import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/color_schemes.dart';

class ConfirmButton extends StatelessWidget {
  final TabController tabController;
  final String labelButton;
  final String? nextRoute;
  const ConfirmButton({
    super.key,
    required this.tabController,
    required this.labelButton,
    this.nextRoute ,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
        if (nextRoute != null) {
          context.go(nextRoute ?? '');
        }
        else {
          tabController.animateTo(tabController.index + 1);
        }
      },
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
      child: Text(
        labelButton,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: whiteColor,
        ),
      ),
    );
  }
}
