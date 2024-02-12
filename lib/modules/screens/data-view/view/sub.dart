import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/model/Json-model.dart';

class SubView extends StatelessWidget {
  const SubView({super.key});

  @override
  Widget build(BuildContext context) {
    JsonModel data = Get.arguments;

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //     borderRadi
          //     us: BorderRadius.circular(70),

          gradient: LinearGradient(
            colors: [
              Colors.pinkAccent.withOpacity(0.3),
              Colors.purpleAccent.withOpacity(0.2),
            ],
          ),
        ),
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(0, -64),
              child: Container(
                height: Get.height / 2,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.withOpacity(0.3),
                      Colors.blue.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Text(
                  '${data.quote}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                    shadows: [
                      Shadow(color: Colors.grey, blurRadius: 23),
                    ],
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 400),
              child: Container(
                height: Get.height / 6.8,
                width: Get.width / 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 56,
                      offset: Offset(0, 9),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.9),
                            Colors.white.withOpacity(0.9),
                          ],
                        ),
                      ),
                      child: Text(
                        '${data.author}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Get.height / 23,
                      width: Get.width / 9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.withOpacity(0.3),
                            Colors.blue.withOpacity(0.2),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        '${data.id}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.9),
                  ],
                ),
              ),
              child: Text(
                '${data.author}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withOpacity(0.3),
                    Colors.blue.withOpacity(0.2),
                  ],
                ),
              ),
              child: Text('${data.id}'),
            ),
            // Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(70),
            //       gradient: LinearGradient(
            //         colors: [
            //           Colors.purple.withOpacity(0.3),
            //           Colors.blue.withOpacity(0.2),
            //         ],
            //       ),
            //     ),
            //     child: Text('${data.category}')),
          ],
        ),
      ),
    );
  }
}
