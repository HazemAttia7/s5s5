import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final Color backColor;
  final String text;
  final VoidCallback onTap;
  final double width;
  const CustomBadge({
    super.key,
    required this.backColor,
    required this.text,
    required this.onTap,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(1000),
        ),
        width: width,
        height: 50,
        child: Center(
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
