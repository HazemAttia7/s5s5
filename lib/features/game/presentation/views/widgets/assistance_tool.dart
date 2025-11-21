import 'package:flutter/material.dart';
import 'package:s5s5/core/utils/app_colors.dart';

class AssistanceTool extends StatelessWidget {
  final IconData icon;
  final bool isDisabled, isSelected;
  final VoidCallback? onTap;
  const AssistanceTool({
    super.key,
    required this.icon,
    this.isDisabled = true,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isDisabled && !isSelected,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          foregroundDecoration: isSelected
              ? null
              : BoxDecoration(
                  border: isSelected
                      ? null
                      : Border.all(
                          color: isDisabled && !isSelected
                              ? Colors.grey
                              : AppColors.secondaryColor,
                          width: 4,
                        ),
                  color: isSelected ? AppColors.secondaryColor : null,
                  shape: BoxShape.circle,
                ),
          decoration: isSelected
              ? BoxDecoration(
                  border: isSelected
                      ? null
                      : Border.all(
                          color: isDisabled
                              ? Colors.grey
                              : AppColors.secondaryColor,
                          width: 4,
                        ),
                  color: isSelected ? AppColors.secondaryColor : null,
                  shape: BoxShape.circle,
                )
              : null,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(child: Icon(icon, color: _getIconColor(), size: 32)),
        ),
      ),
    );
  }

  Color _getIconColor() {
    return isDisabled && !isSelected
        ? Colors.grey
        : isSelected
        ? Colors.white
        : AppColors.secondaryColor;
  }
}
