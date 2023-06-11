import 'package:flutter/material.dart';
import '../../controllers/game_controller.dart';
import 'cell.dart';
import 'package:pacman_getx/constants.dart';
import 'package:get/get.dart';

class Board extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();

  Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(
      builder: (GetxController controller) => GestureDetector(
        onVerticalDragUpdate: (details) {
          gameController.changeDirection(details, true);
        },
        onHorizontalDragUpdate: (details) {
          gameController.changeDirection(details, false);
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
