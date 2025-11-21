import 'package:flutter/material.dart';
import 'package:s5s5/core/utils/app_colors.dart';

class CategoryBadge extends StatelessWidget {
  final String categoryName;
  const CategoryBadge({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Center(
        child: Text(
          categoryName,
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
