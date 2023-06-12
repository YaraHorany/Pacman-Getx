import 'package:pacman_getx/constants.dart';

class Player {
  int position;
  String direction;
  bool mouthClosed;

  Player({
    required this.position,
    required this.direction,
    required this.mouthClosed,
  });

  void move(List barrier) {
    switch (direction) {
      case "right":
        _moveRight(barrier);
        break;
      case "left":
        _moveLeft(barrier);
        break;
      case "up":
        _moveUp(barrier);
        break;
      case "down":
        _moveDown(barrier);
        break;
    }
  }

  void _moveRight(List barrier) {
    if (!barrier.contains(position + 1)) {
      position++;
    }
  }

  void _moveLeft(List barrier) {
    if (!barrier.contains(position - 1)) {
      position--;
    }
  }

  void _moveUp(List barrier) {
    if (!barrier.contains(position - BoardConstants.numberInRow)) {
      position -= BoardConstants.numberInRow;
    }
  }

  void _moveDown(List barrier) {
    if (!barrier.contains(position + BoardConstants.numberInRow)) {
      position += BoardConstants.numberInRow;
    }
  }

  void switchMouthClosed() {
    mouthClosed = !mouthClosed;
  }

  void setDirectionUp(List barrier) {
    if (!barrier.contains(position - BoardConstants.numberInRow)) {
      direction = "up";
    }
  }

  void setDirectionDown(List barrier) {
    if (!barrier.contains(position + BoardConstants.numberInRow)) {
      direction = "down";
    }
  }

  void setDirectionRight(List barrier) {
    if (!barrier.contains(position + 1)) {
      direction = "right";
    }
  }

  void setDirectionLeft(List barrier) {
    if (!barrier.contains(position - 1)) {
      direction = "left";
    }
  }
}
