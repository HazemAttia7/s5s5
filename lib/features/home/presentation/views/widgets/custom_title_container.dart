import 'package:flutter/material.dart';
import 'package:s5s5/core/utils/app_colors.dart';

class CustomTitleContainer extends StatelessWidget {
  final String title;
  const CustomTitleContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: AppColors.primaryColor,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
