import 'package:flutter/material.dart';

class CategoryInfo extends StatefulWidget {
  final Function(bool isCircle) changeContainerFit;
  final String info;
  const CategoryInfo({
    super.key,
    required this.changeContainerFit,
    required this.info,
  });

  @override
  State<CategoryInfo> createState() => _CategoryInfoState();
}

class _CategoryInfoState extends State<CategoryInfo> {
  bool isCircle = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCircle = !isCircle;
          });
          widget.changeContainerFit(isCircle);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          ),
          padding: const EdgeInsets.all(14),
          child: Center(
            child: isCircle
                ? const Text(
                    "i",
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  )
                : Text(
                    widget.info,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ),
        ),
      ),
    );
  }
}
