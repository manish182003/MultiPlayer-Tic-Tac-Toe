import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Responsive/responsive.dart';
import 'package:tic_tac_toe/resources/socket_methods.dart';
import 'package:tic_tac_toe/widgets/CustomTextField.dart';
import 'package:tic_tac_toe/widgets/custombutton.dart';
import 'package:tic_tac_toe/widgets/customtext.dart';

class CreateRoomScreen extends StatefulWidget {
  static const String routename = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final SocketMethods socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    socketMethods.CreateRoomSuccessListener(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namecontroller.dispose();
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
                text: 'Create Room',
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
                height: size.height * 0.05,
              ),
              CustomButton(
                onTap: () => socketMethods.createRoom(namecontroller.text),
                text: 'Create',
              )
            ],
          ),
        ),
      ),
    );
  }
}
