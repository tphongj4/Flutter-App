import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labText;
  final TextInputType keyboardType;

  CustomTextField({this.controller, this.keyboardType, this.labText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.green,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          labelText: labText,
      ),
    );
  }
}