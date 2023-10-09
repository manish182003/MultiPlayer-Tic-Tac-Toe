import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Responsive/responsive.dart';
import 'package:tic_tac_toe/screens/create_room_screen.dart';
import 'package:tic_tac_toe/screens/join_room.dart';
import 'package:tic_tac_toe/widgets/custombutton.dart';

class MainMenuScreen extends StatelessWidget {
  static String routename = '/main-menu';
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  CreateRoomScreen.routename,
                );
              },
              text: 'Create Room',
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  JoinRoomScreen.routename,
                );
              },
              text: 'Join Room',
            )
          ],
        ),
      ),
    );
  }
}
