// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.validator,
    required this.onSaved,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon)),
    );
  }
}
