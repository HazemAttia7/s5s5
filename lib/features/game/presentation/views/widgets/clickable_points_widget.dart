import 'package:flutter/material.dart';
import 'package:s5s5/core/utils/app_colors.dart';

class ClickablePointsWidget extends StatelessWidget {
  final String points;
  final bool isRightArm, isDisabled;
  final VoidCallback onTap;
  const ClickablePointsWidget({
    super.key,
    required this.points,
    required this.isRightArm,
    required this.onTap,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isDisabled,
      child: Opacity(
        opacity: isDisabled ? 0.3 : 1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.only(
                topLeft: isRightArm ? Radius.zero : const Radius.circular(1000),
                bottomLeft: isRightArm
                    ? Radius.zero
                    : const Radius.circular(1000),
                topRight: isRightArm
                    ? const Radius.circular(1000)
                    : Radius.zero,
                bottomRight: isRightArm
                    ? const Radius.circular(1000)
                    : Radius.zero,
              ),
            ),
            child: Center(
              child: Text(
                points,
                style: TextStyle(
                  fontSize: 38,
                  color: isDisabled ? Colors.black54 : AppColors.secondaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
