import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List imges = [
    "https://i.pinimg.com/564x/27/d3/64/27d3648c9bff54a53d18f03875bc8a34.jpg",
    "https://i.pinimg.com/564x/c9/ce/f1/c9cef12e1275f29739480d4bafb99755.jpg",
    "https://i.pinimg.com/564x/d7/1a/71/d71a71e0a69f04653edb6679a56eaa1b.jpg",
    "https://i.pinimg.com/564x/08/c2/81/08c2819ce0bffe33d779b2ead33d550e.jpg",
    "https://i.pinimg.com/564x/b3/10/e5/b310e56692692bc8f76b00e358a9ec83.jpg",
    "https://i.pinimg.com/564x/f4/8a/8f/f48a8fedeade5a699b5b123c882036ad.jpg",
    "https://i.pinimg.com/564x/a7/df/ac/a7dfacfb122e95be311707a298f0912f.jpg",
    "https://i.pinimg.com/564x/ed/72/6e/ed726ea6de10b0bacc18b1120b7eac30.jpg",
    "https://i.pinimg.com/564x/8b/ca/44/8bca44765cb3783d40a687ee269a4ed5.jpg",
    "https://i.pinimg.com/564x/e8/6f/da/e86fda4b54fb538b053543f74b52e283.jpg",
    "https://i.pinimg.com/564x/5b/f8/2e/5bf82e4e288b0ba4217caf70c1ba9ec5.jpg",
    "https://i.pinimg.com/564x/3b/06/ab/3b06abd7b18fc1c48fcc8bf65dc104a7.jpg",
    "https://i.pinimg.com/564x/67/55/0f/67550f52fc9a76f085a889d1d4772411.jpg",
    "https://i.pinimg.com/564x/9b/be/f3/9bbef3a6a300c526cb4c3b38b1fae82e.jpg",
    "https://i.pinimg.com/564x/7f/ef/c4/7fefc4663e44d422faf6611d7ad586a4.jpg",
  ];

  @override
  Future<void> _saveImage(BuildContext context, {required int i}) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    late String message;
    Random random = Random(imges.length);
    try {
      final http.Response response = await http.get(Uri.parse(imges[i]));

      final dir = await getTemporaryDirectory();

      var filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';

      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }
    } catch (e) {
      message = e.toString();

      print("$message");

      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFe91e63),
      ));
    }

    if (message != null) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFe91e63),
      ));
    }
  }

  Widget build(BuildContext context) {
    int index = 1;

    return Scaffold(
      backgroundColor: const Color(0xffD36976),
      appBar: AppBar(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://i.pinimg.com/564x/03/6c/7b/036c7b3b7384015fcbadbe3efbefc251.jpg"),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: imges.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.82,
          // mainAxisSpacing: 1,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: () {
            log(1);
            CircleAvatar();
          },
          onTap: () async {
            _saveImage(context, i: index);
          },
          child: Container(
            // height: 120,
            // width: 120,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imges[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
