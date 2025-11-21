import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  const BodyText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(227, 75, 75, 1),
          width: 4,
        ),
        borderRadius: BorderRadius.circular(78),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 38),
        ),
      ),
    );
  }
}
