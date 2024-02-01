import 'dart:convert';
import 'dart:developer';

import 'package:db_miner/modules/screens/home/model/Jsonbackmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 107,
        // backgroundColor: Colors,
        title: Text(
          "My Quotes",
          style: GoogleFonts.manjari(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: FutureBuilder(
        future: rootBundle.loadString('json_bank.json'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data!);

            List jsonData = data;

            List<JsonModel> objectData =
                jsonData.map((e) => JsonModel.fetchData(data: e)).toList();

            return GridView.builder(
              itemCount: objectData.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                //crossAxisSpacing: 20,
                // mainAxisSpacing: 20,
                // mainAxisExtent: 2,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, i) {
                log('length: ${objectData.length}');

                log("Name: ${objectData[i].author}");
                log("like: ${objectData[i].like}");
                log("category: ${objectData[i].category}");
                log("Id : ${objectData[i].id}");

                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    // width: 300,
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Text('${objectData[i].quote}'),
                    ),
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator(
              color: Colors.lime,
            );
          }
        },
      ),
    );
  }
}
