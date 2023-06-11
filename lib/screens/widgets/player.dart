import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  final bool mouthClosed;
  const MyPlayer({Key? key, required this.mouthClosed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: mouthClosed
          ? Container(
              decoration: BoxDecoration(
                color: Colors.yellow.shade600,
                shape: BoxShape.circle,
              ),
            )
          : Image.asset('images/player.png'),
    );
  }
}
