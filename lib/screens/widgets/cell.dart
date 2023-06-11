import 'dart:math';
import 'package:flutter/material.dart';
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
    for (int i = 0; i < 3; i++) {
      if (gameController.board[index] == 'ghost${i + 1}') {
        return Ghost(
          image: Image.asset(
            'images/ghost${i + 1}.png',
          ),
        );
      }
    }
    if (gameController.board[index] == 'barrier') {
      return MyPixel(
        innerColor: Colors.blue[800]!,
        outerColor: Colors.blue[900]!,
      );
    } else if (gameController.board[index] == 'food') {
      return const MyPixel(
        innerColor: Colors.yellow,
        outerColor: Colors.black,
      );
    } else if (gameController.board[index] == 'player') {
      switch (gameController.playerDirection) {
        case "right":
          return const MyPlayer(
            mouthClosed: false,
          );
          break;
        case "left":
          return Transform.rotate(
            angle: pi,
            child: const MyPlayer(
              mouthClosed: false,
            ),
          );
          break;
        case "up":
          return Transform.rotate(
            angle: 3 * pi / 2,
            child: const MyPlayer(
              mouthClosed: false,
            ),
          );
          break;
        case "down":
          return Transform.rotate(
            angle: pi / 2,
            child: const MyPlayer(
              mouthClosed: false,
            ),
          );
          break;
        default:
          return const MyPlayer(
            mouthClosed: false,
          );
      }
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
