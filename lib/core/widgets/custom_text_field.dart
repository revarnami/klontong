import 'package:flutter/material.dart';

class TextFieldTypeText extends StatelessWidget {
  const TextFieldTypeText({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'SKU',
      ),
    );
  }
}
