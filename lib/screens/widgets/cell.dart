import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pacman_getx/constants.dart';
import 'package:pacman_getx/screens/widgets/pixel.dart';
import 'package:pacman_getx/screens/widgets/player.dart';
import '../../controllers/game_controller.dart';
import 'ghost.dart';
import 'package:get/get.dart';

class Cell extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();

  final int index;

  Cell({
    Key? key,
    required this.index,
  }) : super(key: key);

  Widget _buildCell() {
    for (int i = 0; i < BoardConstants.ghostsNumber; i++) {
      if (gameController.ghosts[i].position == index) {
        return Ghost(
          image: Image.asset(gameController.ghosts[i].image),
        );
      }
    }
    if (gameController.pacman.position == index &&
        gameController.pacman.mouthClosed) {
      return const MyPlayer();
    } else if (gameController.pacman.position == index) {
      switch (gameController.pacman.direction) {
        case "right":
          return const MyPlayer();
        case "left":
          return Transform.rotate(
            angle: pi,
            child: const MyPlayer(),
          );
        case "up":
          return Transform.rotate(
            angle: 3 * pi / 2,
            child: const MyPlayer(),
          );
        case "down":
          return Transform.rotate(
            angle: pi / 2,
            child: const MyPlayer(),
          );
        default:
          return const MyPlayer();
      }
    } else if (gameController.barrier.contains(index)) {
      return MyPixel(
        innerColor: Colors.blue[800]!,
        outerColor: Colors.blue[900]!,
      );
    } else if (gameController.food.contains(index)) {
      return const MyPixel(
        innerColor: Colors.yellow,
        outerColor: Colors.black,
      );
    } else {
      return const MyPixel(
        innerColor: Colors.black,
        outerColor: Colors.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildCell();
  }
}
