import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Sub2 extends StatefulWidget {
  const Sub2({super.key});

  @override
  State<Sub2> createState() => _Sub2State();
}

class _Sub2State extends State<Sub2> {
  nextPage() {
    Get.offAllNamed('/home');
  }

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
          Transform.translate(
            offset: const Offset(-4, 394),
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.white.withAlpha(45),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-3, 414),
            child: Container(
              height: 200,
              width: 250,
              padding: const EdgeInsets.only(left: 40, top: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white.withAlpha(45),
                boxShadow: const [
                  BoxShadow(color: Colors.black, blurRadius: 90),
                ],
              ),
              child: Text(
                "Edit and Share....",
                style: GoogleFonts.play().copyWith(
                  color: Colors.white,
                  fontSize: 34,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(345, 78),
            child: Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
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
          Transform.translate(
            offset: const Offset(345, 78),
            child: Container(
              height: 105,
              width: 105,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withAlpha(45),
                boxShadow: const [
                  BoxShadow(
                    // color: Colors.grey,
                    blurRadius: 45,
                  ),
                ],
              ),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withAlpha(2),
                  boxShadow: const [
                    BoxShadow(
                      // color: Colors.grey,
                      blurRadius: 45,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(303, 780),
            child: FloatingActionButton(
              backgroundColor: Colors.white10,
              onPressed: nextPage,
              child: Icon(
                Icons.arrow_circle_right_rounded,
                color: Colors.white,
                size: 40,
              ),
              shape: UnderlineInputBorder(
                // borderSide: ,
                borderRadius: BorderRadius.circular(
                  34,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
