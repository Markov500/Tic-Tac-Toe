import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: darkcolor,
        backgroundColor: secondarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
      ),
      label: const Text(
        "PLAY",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      icon: const Icon(
        Icons.play_arrow,
        size: 22,
      ),
      onPressed: () {
        print("play");
      },
    );
  }
}
