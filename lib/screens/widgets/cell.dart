import 'package:flutter/material.dart';
import 'package:pacman_getx/screens/widgets/pixel.dart';
import 'package:pacman_getx/screens/widgets/player.dart';

import 'ghost.dart';

class Cell extends StatelessWidget {
  final int index;

  const Cell({
    Key? key,
    required this.index,
  }) : super(key: key);

  Widget _buildCell() {
    return Ghost(
      image: Image.asset(
        'images/ghost1.png',
      ),
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return _buildCell();
  }
}
