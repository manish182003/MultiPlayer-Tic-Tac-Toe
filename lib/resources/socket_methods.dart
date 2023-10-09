import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Provider/roomdataprovider.dart';
import 'package:tic_tac_toe/Utils/utils.dart';
import 'package:tic_tac_toe/resources/game_methods.dart';
import 'package:tic_tac_toe/resources/socket_client.dart';
import 'package:tic_tac_toe/screens/game_Screen.dart';

class SocketMethods {
  final socketclient = SocketClient.instance.socket!;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      socketclient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      socketclient.emit('joinRoom', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  void tapGrid(int index, String roomId, List<String> displayElements) {
    if (displayElements[index] == '') {
      socketclient.emit(
        'tap',
        {
          'index': index,
          'roomId': roomId,
        },
      );
    }
  }

  void CreateRoomSuccessListener(BuildContext context) {
    socketclient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routename);
    });
  }

  void JoinRoomSuccessListner(BuildContext context) {
    socketclient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routename);
    });
  }

  void ErrorOccuredListener(BuildContext context) {
    socketclient.on(
      'errorOccurred',
      (data) {
        showsnackbar(context, data);
      },
    );
  }

  void updatePlayerStateListener(BuildContext context) {
    socketclient.on('updatePlayers', (data) {
      Provider.of<RoomDataProvider>(context, listen: false).updatePlayer1(
        data[0],
      );

      Provider.of<RoomDataProvider>(context, listen: false).updatePlayer2(
        data[1],
      );
    });
  }

  void updateRoomListener(BuildContext context) {
    socketclient.on('updateRoom', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
    });
  }

  void TappedListener(BuildContext context) {
    socketclient.on('tapped', (data) {
      RoomDataProvider roomDataProvider =
          Provider.of<RoomDataProvider>(context, listen: false);

      roomDataProvider.updateDisplayElements(
        data['index'],
        data['choice'],
      );
      roomDataProvider.updateRoomData(data['room']);
      GameMethods().CheckWinner(context, socketclient);
    });
  }

  void pointIncreaseListener(BuildContext context) {
    socketclient.on(
      'pointIncrease',
      (data) {
        var roomdataprovider =
            Provider.of<RoomDataProvider>(context, listen: false);

        if (data['socketID'] == roomdataprovider.player1.SocketId) {
          roomdataprovider.updatePlayer1(data);
          print(roomdataprovider.player1.Points);
        } else {
          roomdataprovider.updatePlayer2(data);
          print(roomdataprovider.player2.Points);
        }
      },
    );
  }

  void EndGameListener(BuildContext context) {
    socketclient.on('endGame', (data) {
      showGameDialog(context, '${data['nickname']} won the Game');
      Navigator.popUntil(context, (route) => false);
    });
  }
}
