import 'package:flutter/material.dart';
import 'package:get/get.dart';

class secView extends StatelessWidget {
  const secView({super.key});

  @override
  next() {
    Get.offAndToNamed('/home');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade500.withOpacity(0.4),
              Colors.purple.shade500.withOpacity(0.4),
              Colors.red.shade500.withOpacity(0.4),
            ],
          ),
        ),
        child: Stack(
          children: [
            FilledButton(
              onPressed: next,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.purple.shade700.withOpacity(0.4),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                fixedSize: const Size(250, 60),
              ),
              child: const Text(
                'READ NEW QUOTES   >>',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
