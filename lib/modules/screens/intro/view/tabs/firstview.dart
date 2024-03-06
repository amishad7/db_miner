import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class firstView extends StatelessWidget {
  const firstView({super.key});

  @override
  next() {
    Get.toNamed('/home');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.pinkAccent.withAlpha(96),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.pink,
            radius: 56,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Quotes Creator",
                style: GoogleFonts.pacifico().copyWith(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 88.0),
                child: Text(
                  "design your quotes",
                  style: GoogleFonts.pacifico().copyWith(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
