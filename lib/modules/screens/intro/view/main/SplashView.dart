import 'package:db_miner/modules/screens/intro/view/sub/sub.dart';
import 'package:db_miner/modules/screens/intro/view/sub/sub2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class firstView extends StatelessWidget {
  const firstView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            SubSplash(),
            Sub2(),
          ],
        ),
      ),
    );
  }
}
