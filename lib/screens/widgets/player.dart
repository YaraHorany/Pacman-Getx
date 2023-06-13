import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pacman_getx/controllers/game_controller.dart';

class MyPlayer extends StatelessWidget {
  final Image image;

  const MyPlayer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Get.find<GameController>().pacman.mouthClosed
          ? Container(
              decoration: BoxDecoration(
                color: Colors.yellow.shade600,
                shape: BoxShape.circle,
              ),
            )
          : image,
    );
  }
}
