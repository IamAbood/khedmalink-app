import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/enums.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
    this.color,
    this.brandTextSize = TextSizes.small,
  });
  final TextSizes brandTextSize;
  final Color? color;
  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        textAlign: textAlign,
        style: switch (brandTextSize) {
          TextSizes.small =>
            Theme.of(context).textTheme.labelMedium!.apply(color: color),
          TextSizes.medium =>
            Theme.of(context).textTheme.bodyLarge!.apply(color: color),
          TextSizes.large =>
            Theme.of(context).textTheme.titleLarge!.apply(color: color)
        });
  }
}
