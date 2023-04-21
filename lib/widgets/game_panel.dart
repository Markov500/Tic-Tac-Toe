import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';

class GamePanel extends StatelessWidget {
  final List<String> identifier;
  final Color bgcolor;

  final action;
  const GamePanel(
      {super.key,
      required this.identifier,
      required this.bgcolor,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: bgcolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  identifier[index],
                  style: TextStyle(
                    fontSize: 40,
                    color:
                        identifier[index] == "X" ? primarycolor : dangercolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onTap: () {
              action(index);
            },
          );
        });
  }
}
