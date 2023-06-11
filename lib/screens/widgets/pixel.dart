import 'package:flutter/material.dart';

// This class is for drawing the path and the barrier.
class MyPixel extends StatelessWidget {
  final Color innerColor;
  final Color outerColor;

  const MyPixel({
    Key? key,
    required this.innerColor,
    required this.outerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: outerColor == Colors.black
              ? const EdgeInsets.all(12)
              : const EdgeInsets.all(4),
          color: outerColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(color: innerColor),
          ),
        ),
      ),
    );
  }
}
