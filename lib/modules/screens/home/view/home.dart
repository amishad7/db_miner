import 'dart:convert';
import 'dart:developer';

import 'package:db_miner/modules/screens/home/controller/home.dart';
import 'package:db_miner/modules/utils/helper/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/Json-model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchData = TextEditingController();

    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        elevation: 0,
        onPressed: () {
          Get.bottomSheet(
            Container(
              height: 160,
              color: Colors.grey.shade900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.grey,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        elevation: 0,
                        onPressed: () {},
                        child: const Icon(
                          Icons.star_border,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Favourite",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => FloatingActionButton(
                          backgroundColor: Colors.grey,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          elevation: 0,
                          onPressed: () {
                            homeController.changeView();
                          },
                          child: Icon(
                            (homeController.c1.show.value)
                                ? Icons.rectangle
                                : Icons.grid_view,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (homeController.c1.show.value)
                            ? "List View"
                            : "grid view",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(
          Icons.more_horiz,
          color: Colors.white70,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 05, right: 5, top: 29),
        child: FutureBuilder(
          future: DBHelper.dbHelper.showData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<JsonModel>? data = snapshot.data;

              return Obx(() => (homeController.c1.show.value)
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        // log('-----------------------');
                        // log('---------DATA----------');
                        // log('-----------------------');
                        // log('-----------------------');
                        log('${data[index].id} :: ${data[index].id}');
                        log('${data[index].quote} :: ${data[index].category}');
                        log('${data[index].author}');
                        //     log('-----------------------');

                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/subview', arguments: data[index]);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 04,
                              vertical: 04,
                            ),
                            padding: const EdgeInsets.all(19), //
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withAlpha(23),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data[index].author}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    '${data[index].quote}',
                                    softWrap: true,
                                    maxLines: 5,
                                    style: GoogleFonts.aBeeZee().copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        // log('-----------------------');
                        // log('---------DATA----------');
                        // log('-----------------------');
                        // log('-----------------------');
                        log('${data[index].id} :: ${data[index].id}');
                        log('${data[index].quote} :: ${data[index].category}');
                        log('${data[index].author}');
                        //     log('-----------------------');

                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/subview', arguments: data[index]);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 04,
                              vertical: 04,
                            ),
                            padding: const EdgeInsets.all(29),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withAlpha(23),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data[index].quote}',
                                  style: GoogleFonts.aBeeZee().copyWith(
                                    color: Colors.black,
                                    // overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "${data[index].author}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ));
            } else if (snapshot.hasError) {
              return Text(
                'Error occurred:${snapshot.error}',
                style: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 20,
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
