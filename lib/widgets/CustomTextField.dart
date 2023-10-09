import 'package:flutter/material.dart';

import 'package:tic_tac_toe/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final bool isReadOnly;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hinttext,
    this.isReadOnly=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 5,
          spreadRadius: 5,
        )
      ]),
      child: TextField(
        readOnly: isReadOnly,
        controller: controller,
        decoration: InputDecoration(
          fillColor: colorBg,
          filled: true,
          hintText: hinttext,
        ),
      ),
    );
  }
}
