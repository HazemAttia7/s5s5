import 'package:flutter/material.dart';
import 'package:s5s5/core/utils/app_styles.dart';

class TeamsTextField extends StatelessWidget {
  final TextEditingController controller;
  const TeamsTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        style: AppStyles.textStyle20,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          hintText: "اسم الفريق",
          hintStyle: AppStyles.textStyle20.copyWith(color: Colors.grey),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    );
  }
}
