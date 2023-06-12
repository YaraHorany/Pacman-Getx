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
          const Expanded(
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
                Obx(
                  () => Text(
                    "Score: ${gameController.score.toString()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GetBuilder<GameController>(
                  builder: (GetxController controller) =>
                      gameController.gameStarted
                          ? gameController.paused
                              ? GestureDetector(
                                  onTap: () {
                                    gameController.switchPaused();
                                  },
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    gameController.switchPaused();
                                    gameController.mouthClosed = false;
                                  },
                                  child: const Icon(
                                    Icons.pause,
                                    color: Colors.white,
                                  ),
                                )
                          : GestureDetector(
                              onTap: () {
                                gameController.play();
                              },
                              child: const Text(
                                'Start',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
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
