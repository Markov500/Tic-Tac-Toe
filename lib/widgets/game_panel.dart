import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';

class GamePanel extends StatelessWidget {
  final List<String> identifier;
  final Color bgcolor;

  final action;
  final List<int> winIndex;
  const GamePanel(
      {super.key,
      required this.identifier,
      required this.bgcolor,
      required this.action,
      required this.winIndex});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1.18,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: winIndex.contains(index) ? Colors.black87 : bgcolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  identifier[index],
                  style: TextStyle(
                    fontSize: 55,
                    color:
                        identifier[index] == "X" ? primarycolor : dangercolor,
                    fontWeight: FontWeight.w900,
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
