import 'package:flutter/material.dart';
import 'package:get/get.dart';

class firstView extends StatelessWidget {
  const firstView({super.key});

  @override
  next() {
    Get.toNamed('/home');
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
            Transform.translate(
              offset: const Offset(-40, -283),
              child: const DefaultTextStyle(
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  wordSpacing: 2,
                  fontWeight: FontWeight.bold,
                  decorationStyle: TextDecorationStyle.dashed,
                  letterSpacing: 3,
                  fontSize: 40,
                ),
                child: Text('Daily\nQuotes'),
              ),
            ),
            const Text(
              'Quotes App',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                color: Colors.white,
                fontSize: 45,
                letterSpacing: -4,
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 60),
              child: FilledButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
