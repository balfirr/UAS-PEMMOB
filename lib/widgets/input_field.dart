import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  InputField({
    required this.label,
    this.isPassword = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
