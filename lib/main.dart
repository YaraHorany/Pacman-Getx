import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pacman_getx/screens/game_screen/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => GameScreen(),
        ),
      ],
    );
  }
}
