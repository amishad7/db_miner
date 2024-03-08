import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SubSplash extends StatefulWidget {
  const SubSplash({super.key});

  @override
  State<SubSplash> createState() => _SubSplashState();
}

class _SubSplashState extends State<SubSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.5,
                image: NetworkImage(
                    "https://i.pinimg.com/564x/3e/27/1b/3e271b097c955d6dcdef83b92a1e124f.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.0, top: 67),
            child: Text(
              "Get\nStarted\nWith\nUs",
              style: GoogleFonts.bebasNeue().copyWith(
                color: Colors.white,
                fontSize: 56,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(125, 394),
            child: Container(
              height: 200,
              width: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withAlpha(45),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(145, 414),
            child: Container(
              height: 200,
              width: 450,
              padding: EdgeInsets.only(left: 23, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withAlpha(45),
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 90),
                ],
              ),
              child: Text(
                "Be a Own \nwriter",
                style: GoogleFonts.play().copyWith(
                  color: Colors.white,
                  fontSize: 34,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(45, 78),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 45,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
