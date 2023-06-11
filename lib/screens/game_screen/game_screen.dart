import 'package:flutter/material.dart';
import '../../controllers/game_controller.dart';
import '../widgets/board.dart';
import 'package:get/get.dart';

class GameScreen extends StatelessWidget {
  final GameController gameController = Get.find<GameController>();

  GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Board(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    gameController.resetGame();
                  },
                  child: const Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
