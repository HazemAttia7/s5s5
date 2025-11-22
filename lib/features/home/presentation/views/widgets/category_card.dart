import 'package:flutter/material.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';
import 'package:s5s5/features/home/presentation/views/widgets/category_info.dart';
import 'package:s5s5/features/home/presentation/views/widgets/custom_title_container.dart';

class CategoryCard extends StatefulWidget {
  final bool isSelected, isDisabled;
  final VoidCallback onTap;
  final Category category;
  const CategoryCard({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
    required this.isDisabled,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  double? leftPosition = null, topPosition = -32;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: widget.isDisabled && !widget.isSelected ? null : widget.onTap,
          child: ColorFiltered(
            colorFilter: widget.isDisabled && !widget.isSelected
                ? const ColorFilter.matrix([
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0.2126,
                    0.7152,
                    0.0722,
                    0,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                  ])
                : const ColorFilter.mode(Colors.transparent, BlendMode.dst),
            child: Container(
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: widget.isSelected
                    ? Border.all(color: Colors.blue, width: 3)
                    : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        widget.category.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: CustomTitleContainer(title: widget.category.name),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: topPosition,
          right: 0,
          left: leftPosition,
          child: CategoryInfo(
            changeContainerFit: (bool isCircle) {
              setState(() {
                leftPosition = isCircle ? null : 0;
                topPosition = isCircle ? -32 : 0;
              });
            },
            info: widget.category.info,
          ),
        ),
      ],
    );
  }
}
