import 'dart:async';
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
  String information = "Turn of player O";
  bool isOTurn = true;
  bool gameOn = false;
  static const maxseconds = 8;
  int seconds = maxseconds;
  Timer? timer;
  List<String> boxList = ["", "", "", "", "", "", "", "", ""];
  List<int> winBoxIndex = [];
/*
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void resetIimer() {
    seconds = maxseconds;
  }
*/
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
    isWon();
  }

  void isWon() async {
    String winner = "";
    if (boxList[0] == boxList[1] &&
        boxList[0] == boxList[2] &&
        boxList[0] != "") {
      winner = boxList[0];
      setState(() {
        winBoxIndex.addAll([0, 1, 2]);
      });
    } else if (boxList[0] == boxList[3] &&
        boxList[0] == boxList[6] &&
        boxList[0] != "") {
      winner = boxList[0];
      setState(() {
        winBoxIndex.addAll([0, 3, 6]);
      });
    } else if (boxList[6] == boxList[7] &&
        boxList[6] == boxList[8] &&
        boxList[6] != "") {
      winner = boxList[6];
      setState(() {
        winBoxIndex.addAll([6, 7, 8]);
      });
    } else if (boxList[2] == boxList[5] &&
        boxList[2] == boxList[8] &&
        boxList[2] != "") {
      winner = boxList[2];
      setState(() {
        winBoxIndex.addAll([2, 5, 8]);
      });
    } else if (boxList[2] == boxList[4] &&
        boxList[2] == boxList[6] &&
        boxList[2] != "") {
      winner = boxList[2];
      setState(() {
        winBoxIndex.addAll([2, 4, 6]);
      });
    } else if (boxList[0] == boxList[4] &&
        boxList[0] == boxList[8] &&
        boxList[0] != "") {
      winner = boxList[0];
      setState(() {
        winBoxIndex.addAll([0, 4, 8]);
      });
    } else if (boxList[1] == boxList[4] &&
        boxList[1] == boxList[7] &&
        boxList[1] != "") {
      winner = boxList[1];
      setState(() {
        winBoxIndex.addAll([1, 4, 7]);
      });
    } else if (boxList[3] == boxList[4] &&
        boxList[3] == boxList[5] &&
        boxList[3] != "") {
      winner = boxList[3];
      setState(() {
        winBoxIndex.addAll([3, 4, 5]);
      });
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
  }

  void win(String winner) async {
    setState(() {
      information = "Player $winner wins!!";
      gameOn = false;
    });

    await Future.delayed(
        Duration(milliseconds: 1500),
        () => setState(() {
              isOTurn
                  ? information = "Turn of player O"
                  : information = "Turn of player X";
              boxList = ["", "", "", "", "", "", "", "", ""];
              winBoxIndex = [];
            }));
    incrementScore(winner);
  }

  void incrementScore(String player) async {
    await Future.delayed(
        Duration(milliseconds: 200),
        () => setState(() {
              (player == "O") ? player1Score += 1 : player2Score += 1;
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
                winIndex: winBoxIndex,
                bgcolor: secondarycolor,
                action: gameOn ? handlePlayerTurn : print,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ),
              gameOn
                  ? Text("")
                  : TextIconButton(
                      action: () {
                        setState(() {
                          gameOn = true;
                        });
                      },
                    )
            ],
          )
        ],
      ),
    );
  }
}
