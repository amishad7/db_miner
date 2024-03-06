import 'package:db_miner/modules/screens/intro/view/tabs/firstview.dart';
import 'package:db_miner/modules/screens/intro/view/tabs/secview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  next() {
    Get.toNamed('/home');
  }

  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [firstView(), secView()],
        ),
      ),
    );
  }
}
