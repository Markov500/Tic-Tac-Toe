import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/widgets/game_panel.dart';
import 'package:tic_tac_toe/widgets/player.dart';
import 'package:tic_tac_toe/widgets/text_icon_button.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightcolor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: lightcolor,
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(
            color: darkcolor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Player(
                  identifier: "O",
                  score: player1Score,
                  textcolor: dangercolor,
                ),
                Player(
                  identifier: "X",
                  score: player2Score,
                  textcolor: primarycolor,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const GamePanel(
                identifier: "",
                bgcolor: secondarycolor,
                textcolor: darkcolor,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const TextIconButton(),
              )
            ],
          )
        ],
      ),
    );
  }
}
