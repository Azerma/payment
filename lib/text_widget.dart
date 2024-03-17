import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.inputText});

  final String inputText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        inputText,
        style: TextStyle(
          color: Color.fromARGB(255, 242, 239, 231),
          fontSize: 12,
        ),
      ),
    );
  }
}
