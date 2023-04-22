import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/widgets/game_panel.dart';
import 'package:tic_tac_toe/widgets/player.dart';

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
  String information = "Turn of player O";
  bool isOTurn = true;
  List<String> boxList = ["", "", "", "", "", "", "", "", ""];

  void handlePlayerTurn(int index) async {
    setState(() {
      if (isOTurn && boxList[index] == "") {
        boxList[index] = "O";
      } else if (!isOTurn && boxList[index] == "") {
        boxList[index] = "X";
      }

      isOTurn = !isOTurn;

      isOTurn
          ? information = "Turn of player O"
          : information = "Turn of player X";
    });
    winTheGame();
  }

  void winTheGame() async {
    String winner = "";
    if (boxList[0] == boxList[1] &&
        boxList[0] == boxList[2] &&
        boxList[0] != "") {
      winner = boxList[0];
    } else if (boxList[0] == boxList[3] &&
        boxList[0] == boxList[6] &&
        boxList[0] != "") {
      winner = boxList[0];
    } else if (boxList[6] == boxList[7] &&
        boxList[6] == boxList[8] &&
        boxList[6] != "") {
      winner = boxList[6];
    } else if (boxList[2] == boxList[5] &&
        boxList[2] == boxList[8] &&
        boxList[2] != "") {
      winner = boxList[2];
    } else if (boxList[2] == boxList[4] &&
        boxList[2] == boxList[6] &&
        boxList[2] != "") {
      winner = boxList[2];
    } else if (boxList[0] == boxList[4] &&
        boxList[0] == boxList[8] &&
        boxList[0] != "") {
      winner = boxList[0];
    } else if (boxList[1] == boxList[4] &&
        boxList[1] == boxList[7] &&
        boxList[1] != "") {
      winner = boxList[1];
    } else if (boxList[3] == boxList[4] &&
        boxList[3] == boxList[5] &&
        boxList[3] != "") {
      winner = boxList[3];
    } else if (boxList.where((element) => element == "").isEmpty) {
      setState(() {
        information = "Nobody win";

        boxList = ["", "", "", "", "", "", "", "", ""];
      });
      await Future.delayed(
          Duration(milliseconds: 1500),
          () => setState(() {
                isOTurn
                    ? information = "Turn of player O"
                    : information = "Turn of player X";
              }));
    }

    if (winner != "") {
      setState(() {
        information = "Player $winner wins!!";
      });

      await Future.delayed(
          Duration(milliseconds: 300),
          () => setState(() {
                isOTurn
                    ? information = "Turn of player O"
                    : information = "Turn of player X";
              }));
      incrementScore(winner);
    }
  }

  void incrementScore(String player) async {
    await Future.delayed(
        Duration(milliseconds: 200),
        () => setState(() {
              (player == "O") ? player1Score += 1 : player2Score += 1;
              boxList = ["", "", "", "", "", "", "", "", ""];
            }));
  }

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
              child: GamePanel(
                identifier: boxList,
                bgcolor: secondarycolor,
                action: handlePlayerTurn,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  information,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
