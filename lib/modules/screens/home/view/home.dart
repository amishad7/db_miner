import 'dart:convert';

import 'package:db_miner/modules/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/Jsonbackmodel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 20,
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Colors.purple.withOpacity(0.2),
              ),
              child: FutureBuilder(
                future: rootBundle.loadString('json_bank.json'),
                builder: (context, snapshot) {
                  List data = jsonDecode(snapshot.data!);
                  List<JsonModel> modelData = data
                      .map(
                        (e) => JsonModel.fetchData(data: e),
                      )
                      .toList();
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: modelData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Future<int?> res = DBHelper.dbHelper
                            .insertQuery(jsonModel: modelData[index]);

                        return Container(
                          width: MediaQuery.sizeOf(context).height / 2.85,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [
                              Transform.translate(
                                offset: Offset(-4, 67),
                                child: Chip(
                                  label: Text("${modelData[index].id}"),
                                ),
                              ),
                              Text(
                                '${modelData[index].quote}',
                                style: const TextStyle(
                                  inherit: true,
                                  wordSpacing: -2,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
          Expanded(
            flex: 2,
            child: Container(

                // child: FutureBuilder(future: future, builder: builder),

                ),
          ),
        ],
      ),
    );
  }
}
