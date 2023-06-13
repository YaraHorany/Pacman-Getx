import 'dart:math';
import 'package:pacman_getx/constants.dart';

class Ghost {
  int position;
  String direction;
  final String image;

  Ghost({
    required this.position,
    required this.direction,
    required this.image,
  });

  void move(List barrier) {
    List<String> ways = _checkPossibleWays(barrier);
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

  List<String> _checkPossibleWays(List barrier) {
    List<String> ways = [];

    if (!barrier.contains(position + 1)) {
      ways.add("right");
    }
    if (!barrier.contains(position - 1)) {
      ways.add("left");
    }
    if (!barrier.contains(position - BoardConstants.numberInRow)) {
      ways.add("up");
    }
    if (!barrier.contains(position + BoardConstants.numberInRow)) {
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
