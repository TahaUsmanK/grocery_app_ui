import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color color;
  final Function()? onTap;
  final BoxBorder? boxBorder;
  CustomContainer({
    super.key,
    required this.borderRadius,
    required this.color,
    required this.height,
    required this.child,
    required this.width,
    required this.onTap,
    this.boxBorder,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: boxBorder,
          color: color,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
