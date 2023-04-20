import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final String identifier;
  final int score;
  final Color textcolor;
  const Player(
      {super.key,
      required this.identifier,
      required this.score,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Player $identifier",
          style: TextStyle(
            fontSize: 30,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "$score",
          style: TextStyle(
            fontSize: 25,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
