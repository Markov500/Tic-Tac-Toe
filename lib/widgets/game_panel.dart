import 'package:flutter/material.dart';

class GamePanel extends StatelessWidget {
  final String identifier;
  final Color bgcolor;
  final Color textcolor;
  const GamePanel(
      {super.key,
      required this.identifier,
      required this.bgcolor,
      required this.textcolor});

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
                  identifier,
                  style: TextStyle(
                    fontSize: 40,
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            onTap: () {
              print(identifier);
            },
          );
        });
  }
}
