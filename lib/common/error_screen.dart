import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.details});

  final FlutterErrorDetails? details;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.green,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            details?.stack.toString() ?? 'Error',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
