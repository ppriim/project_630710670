import 'package:flutter/material.dart';


class textFieldCos extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const textFieldCos(
      {Key? key, required this.controller, required this.hintText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
