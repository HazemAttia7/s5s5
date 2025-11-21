import 'package:flutter/material.dart';
import 'package:s5s5/core/utils/app_colors.dart';
import 'package:s5s5/core/utils/app_styles.dart';

class MainCardHeaderText extends StatelessWidget {
  final String text;
  const MainCardHeaderText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(240),
        color: AppColors.primaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyles.textStyle20.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
