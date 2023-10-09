import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tic_tac_toe/Provider/roomdataprovider.dart';
import 'package:tic_tac_toe/Utils/utils.dart';

class GameMethods {
  void CheckWinner(BuildContext context, Socket socketclient) {
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);

    String winner = '';

    if (roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[1] &&
        roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[2] &&
        roomDataProvider.displayElement[0] != '') {
      winner = roomDataProvider.displayElement[0];
    }

    if (roomDataProvider.displayElement[3] ==
            roomDataProvider.displayElement[4] &&
        roomDataProvider.displayElement[3] ==
            roomDataProvider.displayElement[5] &&
        roomDataProvider.displayElement[3] != '') {
      winner = roomDataProvider.displayElement[3];
    }

    if (roomDataProvider.displayElement[6] ==
            roomDataProvider.displayElement[7] &&
        roomDataProvider.displayElement[6] ==
            roomDataProvider.displayElement[8] &&
        roomDataProvider.displayElement[6] != '') {
      winner = roomDataProvider.displayElement[6];
    }

    if (roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[3] &&
        roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[6] &&
        roomDataProvider.displayElement[0] != '') {
      winner = roomDataProvider.displayElement[0];
    }

    if (roomDataProvider.displayElement[1] ==
            roomDataProvider.displayElement[4] &&
        roomDataProvider.displayElement[1] ==
            roomDataProvider.displayElement[7] &&
        roomDataProvider.displayElement[1] != '') {
      winner = roomDataProvider.displayElement[1];
    }

    if (roomDataProvider.displayElement[2] ==
            roomDataProvider.displayElement[5] &&
        roomDataProvider.displayElement[2] ==
            roomDataProvider.displayElement[8] &&
        roomDataProvider.displayElement[2] != '') {
      winner = roomDataProvider.displayElement[2];
    }

    if (roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[4] &&
        roomDataProvider.displayElement[0] ==
            roomDataProvider.displayElement[8] &&
        roomDataProvider.displayElement[0] != '') {
      winner = roomDataProvider.displayElement[0];
    }

    if (roomDataProvider.displayElement[2] ==
            roomDataProvider.displayElement[4] &&
        roomDataProvider.displayElement[2] ==
            roomDataProvider.displayElement[6] &&
        roomDataProvider.displayElement[2] != '') {
      winner = roomDataProvider.displayElement[2];
    } else if (roomDataProvider.filledboxes == 9) {
      winner = '';
      //display game dialog box for draw
      showGameDialog(context, 'Draw');
    }

    if (winner != '') {
      if (roomDataProvider.player1.PlayerType == winner) {
        // display game dialog saying player 1 is winner
        showGameDialog(
            context, '${roomDataProvider.player1.nickname} is Winner!');
        socketclient.emit(
          'winner',
          {
            'winnerSocketId': roomDataProvider.player1.SocketId,
            'roomId': roomDataProvider.ROOMDATA['_id'],
          },
        );
      } else {
        // display game dialog saying player 2 is winner
        showGameDialog(
            context, '${roomDataProvider.player2.nickname} is Winner!');
        socketclient.emit(
          'winner',
          {
            'winnerSocketId': roomDataProvider.player2.SocketId,
            'roomId': roomDataProvider.ROOMDATA['_id'],
          },
        );
      }
    }
  }

  void ClearBoard(BuildContext context) {
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);

    for (int i = 0; i < roomDataProvider.displayElement.length; i++) {
      roomDataProvider.updateDisplayElements(i, '');
    }
    roomDataProvider.setFilledBoxesto0();
  }
}
