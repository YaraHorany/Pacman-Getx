import 'package:flutter/material.dart';

import 'cell.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 11 * 16,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 11,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Cell(index: index);
      },
    );
  }
}
