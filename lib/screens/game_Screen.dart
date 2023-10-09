import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Provider/roomdataprovider.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/views/tic_tac_toe_board.dart';
import 'package:tic_tac_toe/views/views_scoreboard.dart';
import 'package:tic_tac_toe/views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routename = '/game';
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  SocketMethods socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    socketMethods.updateRoomListener(context);
    socketMethods.updatePlayerStateListener(context);
    socketMethods.pointIncreaseListener(context);
    socketMethods.EndGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
      body: roomDataProvider.ROOMDATA['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ScoreBoard(),
                  TicTacToeBoard(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${roomDataProvider.ROOMDATA['turn']['nickname'].toString().toUpperCase()}\'s turn',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
