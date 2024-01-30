import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/screens/home/view/home.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "DB miner",
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
        ),
      ],
    ),
  );
}
