import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final Color themeColor;
  final VoidCallback onIncrement, onDecrement;
  final int count;
  final bool outlinedIcons;
  const CounterWidget({
    super.key,
    this.themeColor = Colors.black,
    required this.onIncrement,
    required this.onDecrement,
    required this.count,
    this.outlinedIcons = true,
  });

  // int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black, width: 2),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onIncrement,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                outlinedIcons ? Icons.add_circle_outline : Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: themeColor,
              height: 1,
            ),
          ),
          InkWell(
            onTap: onDecrement,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                outlinedIcons ? Icons.remove_circle_outline : Icons.remove,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
