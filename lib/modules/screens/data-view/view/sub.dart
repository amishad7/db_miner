import 'dart:developer';

import 'package:db_miner/modules/screens/data-view/controller/dataController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../home/model/Json-model.dart';

class SubView extends StatelessWidget {
  const SubView({super.key});

  @override
  Widget build(BuildContext context) {
    JsonModel data = Get.arguments;

    var dataController = Get.put(DataController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              log("Tab on back ");
            },
            icon: const Icon(
              Icons.star_border,
              color: Colors.pinkAccent,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
            log("Tab on back ");
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.pinkAccent,
          ),
        ),
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
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
            SizedBox(height: 40),
            Container(
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
                      boxShadow: const [
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
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                dataController.editVisibility();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(
                  Icons.edit,
                  size: 30,
                  // fill: ,
                  color: Colors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
