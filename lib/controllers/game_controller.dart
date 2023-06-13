import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pacman_getx/constants.dart';
import '../models/ghost_model.dart';
import 'package:pacman_getx/models/player_model.dart';

class GameController extends GetxController {
  List<int> barrier = [];
  List<int> food = [];

  final RxInt _score = 0.obs;
  int get score => _score.value;
  set score(int value) => _score.value = value;

  late Player pacman;
  List<Ghost> ghosts = [];

  late bool paused;
  late bool gameStarted;

  Timer? timer1, timer2, timer3;

  @override
  void onInit() {
    super.onInit();
    _buildBoard();
  }

  void _buildBoard() {
    score = 0;
    paused = false;
    gameStarted = false;

    barrier = BoardConstants
        .barriers[Random().nextInt(BoardConstants.barriers.length)];

    food.clear();
    getFood();

    pacman = Player(
      position: BoardConstants.numberInRow * 13 + 3,
      direction: "right",
      mouthClosed: false,
    );
    ghosts.clear();
    ghosts.add(Ghost(
        position: BoardConstants.numberInRow * 12 - 2,
        direction: "left",
        image: 'images/redGhost.png'));
    ghosts.add(Ghost(
        position: BoardConstants.numberInRow + 1,
        direction: "right",
        image: 'images/yellowGhost.png'));
    ghosts.add(Ghost(
        position: BoardConstants.numberInRow * 5 + 1,
        direction: "down",
        image: 'images/greenGhost.png'));

    update();
  }

  void resetGame() {
    stopTimers();
    _buildBoard();
  }

  void play() {
    gameStarted = true;

    // Moving the player
    timer1 = Timer.periodic(const Duration(milliseconds: 170), (_) {
      if (!paused) {
        pacman.switchMouthClosed();
        if (food.contains(pacman.position)) {
          food.remove(pacman.position);
          score++;
        }
        pacman.move(barrier);
      }
      update();
    });

    // Moving the ghosts.
    timer2 = Timer.periodic(
      const Duration(milliseconds: 600),
      (_) {
        if (!paused) {
          for (int i = 0; i < BoardConstants.ghostsNumber; i++) {
            ghosts[i].move(barrier);
          }
          update();
        }
      },
    );

    // Checking winning/losing scenarios
    timer3 = Timer.periodic(
      const Duration(milliseconds: 10),
      (_) {
        // Winning scenario
        if (food.isEmpty) {
          declareWinningOrLosing();
        }

        // Loosing scenario
        for (int i = 0; i < BoardConstants.ghostsNumber; i++) {
          if (ghosts[i].position == pacman.position) {
            declareWinningOrLosing();
          }
        }
      },
    );
  }

  void switchPaused() {
    paused = !paused;
    update();
  }

  void changeDirection(DragUpdateDetails details, bool verticalUpdate) {
    if (!paused && gameStarted) {
      if (verticalUpdate) {
        if (details.delta.dy > 0) {
          pacman.setDirectionDown(barrier);
        } else if (details.delta.dy < 0) {
          pacman.setDirectionUp(barrier);
        }
      } else {
        if (details.delta.dx > 0) {
          pacman.setDirectionRight(barrier);
        } else if (details.delta.dx < 0) {
          pacman.setDirectionLeft(barrier);
        }
      }
      update();
    }
  }

  // Return true if the given index is located in the path and not in the barrier.
  bool isNotBarrier(int index) => (!barrier.contains(index));

  void stopTimers() {
    timer1!.cancel();
    timer2!.cancel();
    timer3!.cancel();
  }

  void declareWinningOrLosing() {
    pacman.mouthClosed = false;
    update();
    stopTimers();
    Get.defaultDialog(
      title: food.isEmpty ? "Level completed" : "Game Over!",
      content: food.isEmpty
          ? const Text("Congratulations!")
          : Text("Your Score : ${score}"),
      actions: [
        TextButton(
          child: const Text('Restart'),
          onPressed: () {
            Get.back();
            resetGame();
          },
        ),
      ],
    ).then((value) => resetGame());
  }

  // Get the food's initial position.
  void getFood() {
    for (int i = 0; i < BoardConstants.numberOfSquares; i++) {
      if (!barrier.contains(i)) {
        food.add(i);
      }
    }
  }
}
