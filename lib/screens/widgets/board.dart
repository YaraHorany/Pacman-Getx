import 'package:flutter/material.dart';
import 'cell.dart';
import 'package:pacman_getx/constants.dart';
import 'package:get/get.dart';
import 'package:pacman_getx/controllers/game_controller.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (GetxController controller) => GestureDetector(
        onVerticalDragUpdate: (details) {
          Get.find<GameController>().changeDirection(details, true);
        },
        onHorizontalDragUpdate: (details) {
          Get.find<GameController>().changeDirection(details, false);
        },
        child: GridView.builder(
          itemCount: BoardConstants.numberOfSquares,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: BoardConstants.numberInRow,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Cell(index: index);
          },
        ),
      ),
    );
  }
}
