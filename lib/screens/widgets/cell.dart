import 'package:flutter/material.dart';
import 'package:pacman_getx/screens/widgets/pixel.dart';

class Cell extends StatelessWidget {
  final int index;

  const Cell({
    Key? key,
    required this.index,
  }) : super(key: key);

  Widget _buildCell() {
    return MyPixel(
      innerColor: Colors.blue[800]!,
      outerColor: Colors.blue[900]!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCell();
  }
}
