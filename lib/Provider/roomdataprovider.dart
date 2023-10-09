import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> roomData = {};
  List<String> _displayElements = ['', '', '', '', '', '', '', '', ''];
  int _filledBoxes = 0;
  Player _player1 = Player(
    nickname: '',
    SocketId: '',
    Points: 0,
    PlayerType: 'X',
  );

  Player _player2 = Player(
    nickname: '',
    SocketId: '',
    Points: 0,
    PlayerType: 'O',
  );

  Map<String, dynamic> get ROOMDATA => roomData;
  List<String> get displayElement => _displayElements;
  Player get player1 => _player1;
  Player get player2 => _player2;
  int get filledboxes => _filledBoxes;
  void updateRoomData(Map<String, dynamic> data) {
    roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1) {
    _player1 = Player.fromMap(player1);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2) {
    _player2 = Player.fromMap(player2);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _displayElements[index] = choice;
    _filledBoxes += 1;
    notifyListeners();
  }

  void setFilledBoxesto0() {
    _filledBoxes = 0;
  }
}
