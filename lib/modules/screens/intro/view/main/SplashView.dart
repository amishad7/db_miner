import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class firstView extends StatelessWidget {
  const firstView({super.key});

  @override
  next() {
    Get.offAllNamed('/home');
  }

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
              // color: Colors.pinkAccent.withAlpha(96),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://i.pinimg.com/564x/6a/b2/be/6ab2be50feffba39e9088478f03dc12b.jpg"),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text(
                  "Quotes Creator",
                  style: GoogleFonts.pacifico().copyWith(
                    color: Colors.pinkAccent.withAlpha(120),
                    fontSize: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 88.0),
                child: Text(
                  "design your quotes",
                  style: GoogleFonts.pacifico().copyWith(
                    color: Colors.blueAccent,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: const Offset(70, 663),
            child: FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: const Size(290, 53),
                backgroundColor: Colors.purple.withAlpha(90),
                surfaceTintColor: Colors.purple,
                disabledBackgroundColor: Colors.grey,
              ),
              onPressed: next,
              child: const Text(
                "Get started with us",
                style: TextStyle(fontSize: 23),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
