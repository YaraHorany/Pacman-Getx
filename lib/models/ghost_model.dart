import 'dart:math';
import 'package:pacman_getx/constants.dart';

class Ghost {
  int position;
  String direction;

  Ghost({required this.position, required this.direction});

  void move(List board) {
    List<String> ways = checkPossibleWays(board);
    direction = ways[Random().nextInt(ways.length)];

    switch (direction) {
      case "right":
        position++;
        break;
      case "left":
        position--;
        break;
      case "up":
        position -= BoardConstants.numberInRow;
        break;
      case "down":
        position += BoardConstants.numberInRow;
        break;
    }
  }

  List<String> checkPossibleWays(List board) {
    List<String> ways = [];

    if (board[position + 1] != 'barrier') {
      ways.add("right");
    }
    if (board[position - 1] != 'barrier') {
      ways.add("left");
    }
    if (board[position - BoardConstants.numberInRow] != 'barrier') {
      ways.add("up");
    }
    if (board[position + BoardConstants.numberInRow] != 'barrier') {
      ways.add("down");
    }

    // Do not reverse direction if possible
    if (direction == 'left' && ways.contains('right') && ways.length != 1) {
      ways.remove('right');
    } else if (direction == 'right' &&
        ways.contains('left') &&
        ways.length != 1) {
      ways.remove('left');
    } else if (direction == 'up' && ways.contains('down') && ways.length != 1) {
      ways.remove('down');
    } else if (direction == 'down' && ways.contains('up') && ways.length != 1) {
      ways.remove('up');
    }

    return ways;
  }
}
