import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Provider/roomdataprovider.dart';
import 'package:tic_tac_toe/colors.dart';
import 'package:tic_tac_toe/screens/create_room_screen.dart';
import 'package:tic_tac_toe/screens/game_Screen.dart';
import 'package:tic_tac_toe/screens/join_room.dart';
import 'package:tic_tac_toe/screens/mainmenuscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: colorBg,
        ),
        routes: {
          GameScreen.routename:(context) => GameScreen(),
          MainMenuScreen.routename: (context) => MainMenuScreen(),
          JoinRoomScreen.routename: (context) => JoinRoomScreen(),
          CreateRoomScreen.routename: (context) => CreateRoomScreen(),
        },
        initialRoute: MainMenuScreen.routename,
      ),
    );
  }
}
