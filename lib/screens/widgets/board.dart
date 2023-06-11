import 'package:flutter/material.dart';
import '../../controllers/game_controller.dart';
import 'cell.dart';
import 'package:pacman_getx/constants.dart';
import 'package:get/get.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameController>(builder: (context) {
      return GridView.builder(
        itemCount: BoardConstants.numberOfSquares,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: BoardConstants.numberInRow,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Cell(index: index);
        },
      );
    });
  }
}
