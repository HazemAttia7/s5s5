import 'package:flutter/material.dart';

class PointsBadge extends StatelessWidget {
  const PointsBadge({super.key, required this.questionPoints});

  final int questionPoints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          '$questionPoints نقطة ',
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
