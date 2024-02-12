import 'dart:convert';
import 'dart:developer';

import 'package:db_miner/modules/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/Json-model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchData = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('HI! there'),
        flexibleSpace: SafeArea(
          child: Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.all(20),
            // margin: const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
            decoration: const BoxDecoration(
                //   borderRadius: BorderRadius.circular(23),
                color: Colors.white),
            child: FutureBuilder(
              //TODO: LOCAL JSON BANK data calling

              future: rootBundle.loadString('json_bank.json'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List data = jsonDecode(snapshot.data!);
                  List<JsonModel> modelData = data
                      .map(
                        (e) => JsonModel.fetchData(data: e),
                      )
                      .toList();
                  // log('-----------------------');
                  // log('${modelData[1].id}');
                  // log('${modelData[1].quote}');
                  // log('${modelData[1].author}');
                  // log('-----------------------');

                  for (var i in modelData) {
                    // log('-----------------------');
                    // log('${i.id}');
                    // log('${i.quote}');
                    // log('${i.author}');
                    // log('-----------------------');
                    //TODO: DATA SENDING TO HELPER CLASS

                    DBHelper.dbHelper.insertQuery(jsonModel: i);
                  }

                  DBHelper.dbHelper.searchCategory(searchData: searchData.text);

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      gradient: LinearGradient(
                        transform: const GradientRotation(60),
                        colors: [
                          Colors.pink.withOpacity(0.3),
                          Colors.pink.withOpacity(0.1),
                          Colors.purple.withOpacity(0.4),
                          Colors.white.withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: TextFormField(
                      controller: searchData,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Category",
                        labelStyle: TextStyle(
                          color: Colors.purple.shade200,
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                    'Error occurred',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                    ),
                  );
                } else {
                  return const Text('No Data available');
                }
              },
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 05, right: 5, top: 29),
        child: FutureBuilder(
          //TODO: FETCHING DATA FROM DATABASE TABLE

          future: DBHelper.dbHelper.showData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<JsonModel>? data = snapshot.data;

              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  // mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  // log('-----------------------');
                  // log('---------DATA----------');
                  // log('-----------------------');
                  // log('-----------------------');
                  log('${data[index].id} :: ${data[index].id}');
                  log('${data[index].quote} :: ${data[index].category}');
                  log('${data[index].author}');
                  //     log('-----------------------');

                  return Ink(
                    child: InkWell(
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
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.pink.withOpacity(0.2),
                            style: BorderStyle.solid,
                            width: 14,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${data[index].quote}'),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(
                'Error occurred:${snapshot.error}',
                style: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 20,
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'No Data available',
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
