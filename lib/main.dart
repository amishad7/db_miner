import 'package:db_miner/modules/screens/data-view/view/sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/screens/home/view/home.dart';
import 'modules/screens/intro/view/main/SplashView.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "DB miner",
      initialRoute: '/intro',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/intro',
          page: () => const firstView(),
        ),
        GetPage(
          name: '/home',
          page: () => const Home(),
        ),
        GetPage(
          name: '/subview',
          page: () => const SubView(),
        ),
      ],
    ),
  );
}
