import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Responsive/responsive.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/widgets/CustomTextField.dart';
import 'package:tic_tac_toe/widgets/custombutton.dart';
import 'package:tic_tac_toe/widgets/customtext.dart';

class JoinRoomScreen extends StatefulWidget {
  static const String routename = '/join-room';
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController gameidcontroller = TextEditingController();
  final SocketMethods socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    socketMethods.JoinRoomSuccessListner(context);
    socketMethods.ErrorOccuredListener(context);
    socketMethods.updatePlayerStateListener(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namecontroller.dispose();
    gameidcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  )
                ],
                text: 'Join Room',
                fontsize: 70,
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              CustomTextField(
                controller: namecontroller,
                hinttext: 'Enter your nickname',
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: gameidcontroller,
                hinttext: 'Enter Game ID',
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomButton(
                onTap: () {
                  socketMethods.joinRoom(
                    namecontroller.text,
                    gameidcontroller.text,
                  );
                },
                text: 'Join',
              )
            ],
          ),
        ),
      ),
    );
  }
}
