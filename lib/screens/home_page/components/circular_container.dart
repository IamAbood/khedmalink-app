import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.child,
      this.backgraoundColor = TColors.white,
      this.margin});

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgraoundColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgraoundColor,
      ),
      child: child,
    );
  }
}
