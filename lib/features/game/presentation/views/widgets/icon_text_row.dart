import 'package:flutter/material.dart';

class ClickableIconTextRow extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const ClickableIconTextRow({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 5,
        children: [
          Icon(icon, color: Colors.white, size: 38),
          Text(text, style: const TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}
