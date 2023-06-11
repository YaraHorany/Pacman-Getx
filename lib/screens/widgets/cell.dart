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
    if (gameController.board[index] == 'barrier') {
      return MyPixel(
        innerColor: Colors.blue[800]!,
        outerColor: Colors.blue[900]!,
      );
    } else if (gameController.board[index] == 'player') {
      return const MyPlayer(mouthClosed: false);
    } else {
      return const MyPixel(
        innerColor: Colors.yellow,
        outerColor: Colors.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildCell();
  }
}
