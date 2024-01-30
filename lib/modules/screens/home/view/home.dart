import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int index = 1;

    List imges = [
      "https://i.pinimg.com/564x/27/d3/64/27d3648c9bff54a53d18f03875bc8a34.jpg",
      "https://i.pinimg.com/564x/c9/ce/f1/c9cef12e1275f29739480d4bafb99755.jpg",
      "https://i.pinimg.com/564x/d7/1a/71/d71a71e0a69f04653edb6679a56eaa1b.jpg",
      "https://i.pinimg.com/564x/08/c2/81/08c2819ce0bffe33d779b2ead33d550e.jpg",
    ];

    return Scaffold(
      backgroundColor: Color(0xffD36976),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: imges.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 300,
              width: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imges[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
