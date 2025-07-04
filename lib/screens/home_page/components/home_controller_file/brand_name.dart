import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/helper_class/enums.dart';
import 'package:khedma_link/constants/helper_class/prouduct_title_text.dart';

class ProviderNameWithVerifiedIcon extends StatelessWidget {
  const ProviderNameWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final TextSizes brandTextSize;
  final String title;
  final int maxLines;
  final Color? textColor;
  final Color iconColor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ProductTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(
          Iconsax.verify,
          color: iconColor,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}
