import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pacman_getx/constants.dart';

class GameController extends GetxController {
  List<List<int>> barriers = [
    //Easy
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      21,
      22,
      24,
      30,
      32,
      33,
      37,
      38,
      43,
      44,
      48,
      49,
      54,
      55,
      65,
      66,
      76,
      77,
      80,
      81,
      82,
      83,
      87,
      88,
      91,
      92,
      93,
      94,
      98,
      99,
      109,
      110,
      120,
      121,
      125,
      126,
      131,
      132,
      136,
      137,
      142,
      143,
      145,
      151,
      153,
      154,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175
    ],
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      21,
      22,
      32,
      33,
      35,
      41,
      43,
      44,
      54,
      55,
      59,
      60,
      61,
      65,
      66,
      70,
      71,
      72,
      76,
      77,
      81,
      82,
      83,
      97,
      88,
      92,
      93,
      94,
      98,
      99,
      109,
      110,
      112,
      118,
      120,
      121,
      131,
      132,
      142,
      143,
      153,
      154,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175
    ],
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      21,
      22,
      32,
      33,
      43,
      44,
      54,
      55,
      65,
      66,
      76,
      77,
      97,
      88,
      98,
      99,
      109,
      110,
      120,
      121,
      131,
      132,
      142,
      143,
      153,
      154,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175
    ],
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      21,
      22,
      32,
      33,
      35,
      36,
      40,
      41,
      43,
      44,
      47,
      51,
      54,
      55,
      59,
      60,
      61,
      65,
      66,
      70,
      71,
      72,
      76,
      77,
      81,
      82,
      83,
      97,
      88,
      92,
      93,
      94,
      98,
      99,
      102,
      106,
      109,
      110,
      112,
      113,
      117,
      118,
      120,
      121,
      131,
      132,
      142,
      143,
      153,
      154,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175
    ],
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      21,
      22,
      24,
      30,
      32,
      33,
      37,
      38,
      43,
      44,
      48,
      49,
      54,
      55,
      59,
      60,
      65,
      66,
      70,
      71,
      76,
      77,
      80,
      81,
      82,
      83,
      87,
      88,
      91,
      92,
      93,
      94,
      98,
      99,
      103,
      104,
      109,
      110,
      114,
      115,
      120,
      121,
      125,
      126,
      131,
      132,
      136,
      137,
      142,
      143,
      145,
      151,
      153,
      154,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175
    ],

    //Medium
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      22,
      33,
      44,
      55,
      66,
      77,
      99,
      110,
      121,
      132,
      143,
      154,
      165,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175,
      164,
      153,
      142,
      131,
      120,
      109,
      87,
      76,
      65,
      54,
      43,
      32,
      21,
      78,
      79,
      80,
      100,
      101,
      102,
      84,
      85,
      86,
      106,
      107,
      108,
      24,
      35,
      46,
      57,
      30,
      41,
      52,
      63,
      81,
      70,
      59,
      61,
      72,
      83,
      26,
      28,
      37,
      38,
      39,
      123,
      134,
      145,
      129,
      140,
      151,
      103,
      114,
      125,
      105,
      116,
      127,
      147,
      148,
      149
    ],
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      21,
      22,
      27,
      32,
      33,
      43,
      44,
      46,
      47,
      48,
      49,
      50,
      51,
      52,
      54,
      55,
      65,
      66,
      76,
      77,
      78,
      79,
      80,
      81,
      82,
      83,
      84,
      85,
      87,
      88,
      98,
      99,
      101,
      102,
      103,
      105,
      106,
      107,
      108,
      109,
      110,
      120,
      121,
      122,
      131,
      132,
      133,
      137,
      140,
      142,
      143,
      148,
      153,
      154,
      160,
      162,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175
    ],
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      13,
      15,
      21,
      22,
      24,
      26,
      32,
      33,
      35,
      37,
      41,
      43,
      44,
      46,
      52,
      54,
      55,
      57,
      59,
      61,
      65,
      66,
      68,
      70,
      72,
      75,
      76,
      77,
      79,
      81,
      83,
      85,
      87,
      88,
      92,
      94,
      96,
      98,
      99,
      101,
      103,
      109,
      110,
      112,
      114,
      116,
      118,
      120,
      121,
      123,
      125,
      127,
      129,
      131,
      132,
      134,
      136,
      138,
      142,
      143,
      145,
      149,
      152,
      153,
      154,
      156,
      159,
      160,
      163,
      164,
      165,
      171,
      175
    ],
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      22,
      23,
      24,
      25,
      28,
      29,
      30,
      32,
      33,
      44,
      48,
      49,
      55,
      59,
      60,
      65,
      78,
      79,
      80,
      81,
      83,
      86,
      94,
      95,
      96,
      97,
      99,
      100,
      103,
      110,
      113,
      120,
      121,
      124,
      127,
      131,
      132,
      137,
      143,
      144,
      149,
      154,
      155,
      158,
      159,
      160,
      161,
      162,
      163,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175
    ],
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      21,
      32,
      43,
      54,
      65,
      76,
      87,
      98,
      109,
      120,
      131,
      142,
      153,
      164,
      175,
      174,
      173,
      172,
      171,
      170,
      169,
      168,
      167,
      166,
      165,
      154,
      143,
      132,
      121,
      110,
      99,
      88,
      77,
      66,
      55,
      44,
      33,
      22,
      11,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      21,
      22,
      24,
      30,
      32,
      33,
      37,
      38,
      43,
      44,
      48,
      49,
      54,
      55,
      65,
      66,
      76,
      77,
      80,
      81,
      82,
      83,
      87,
      88,
      91,
      92,
      93,
      94,
      98,
      99,
      109,
      110,
      120,
      121,
      125,
      126,
      131,
      132,
      136,
      137,
      142,
      143,
      145,
      151,
      153,
      154,
      164,
      165,
      166,
      167,
      168,
      169,
      170,
      171,
      172,
      173,
      174,
      175
    ],
  ];
  List<int> food = [];
  List<int> empty = [];

  final RxList<String> _board =
      RxList<String>.filled(BoardConstants.numberOfSquares, 'empty');
  List<String> get board => _board.value;
  set board(List<String> value) => _board.value = value;

  final RxInt _score = 0.obs;
  int get score => _score.value;
  set score(int value) => _score.value = value;

  late int playerPos;
  late String playerDirection;

  late int mazeNum;
  late bool paused;
  late bool gameStarted;

  Timer? timer1;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _buildBoard();
  }

  void _buildBoard() {
    score = 0;
    paused = false;
    gameStarted = false;

    mazeNum = Random().nextInt(barriers.length);

    food.clear();
    empty.clear();

    for (int i = 0; i < BoardConstants.numberOfSquares; i++) {
      if (barriers[mazeNum].contains(i)) {
        board[i] = 'barrier';
      } else {
        food.add(i);
        board[i] = 'food';
      }
    }

    // Initial player position
    playerPos = BoardConstants.numberInRow * 13 + 3;
    // Initial player direction
    playerDirection = "right";
    board[playerPos] = 'player';

    update();
  }

  void resetGame() {
    _buildBoard();
  }

  void play() {
    gameStarted = true;
    update();

    // Moving the player
    timer1 = Timer.periodic(const Duration(milliseconds: 170), (_) {
      if (!paused) {
        if (food.contains(playerPos)) {
          food.remove(playerPos);
          empty.add(playerPos);
          score++;
          update();
        }
        board[playerPos] = 'empty';
        switch (playerDirection) {
          case "right":
            moveRight();
            break;
          case "left":
            moveLeft();
            break;
          case "up":
            moveUp();
            break;
          case "down":
            moveDown();
            break;
        }
        board[playerPos] = 'player';
      }
      update();

      if (board.contains('food') == false) {
        stopTimers();
      }
    });
  }

  void switchPaused() {
    paused = !paused;
    update();
  }

  void changeDirection(DragUpdateDetails details, bool verticalUpdate) {
    if (!paused && gameStarted) {
      if (verticalUpdate) {
        if (details.delta.dy > 0 &&
            board[playerPos + BoardConstants.numberInRow] != 'barrier') {
          playerDirection = "down";
        } else if (details.delta.dy < 0 &&
            board[playerPos - BoardConstants.numberInRow] != 'barrier') {
          playerDirection = "up";
        }
      } else {
        if (details.delta.dx > 0 && board[playerPos + 1] != 'barrier') {
          playerDirection = "right";
        } else if (details.delta.dx < 0 && board[playerPos - 1] != 'barrier') {
          playerDirection = "left";
        }
      }
      update();
    }
  }

  void moveRight() {
    if (board[playerPos + 1] != 'barrier') {
      playerPos++;
    }
  }

  void moveLeft() {
    if (board[playerPos - 1] != 'barrier') {
      playerPos--;
    }
  }

  void moveUp() {
    if (board[playerPos - BoardConstants.numberInRow] != 'barrier') {
      playerPos -= BoardConstants.numberInRow;
    }
  }

  void moveDown() {
    if (board[playerPos + BoardConstants.numberInRow] != 'barrier') {
      playerPos += BoardConstants.numberInRow;
    }
  }

  void stopTimers() {
    timer1!.cancel();
  }
}
