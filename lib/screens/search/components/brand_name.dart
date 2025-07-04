import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/helper_class/enums.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/brand_name.dart';
import 'package:khedma_link/screens/search/components/circular_image.dart';

class BrandCart extends StatelessWidget {
  const BrandCart({
    super.key,
    required this.title,
    this.showBorder = true,
    this.onTap,
    this.imagePath = 'assets/banner/jobsearch.png',
    this.brandName = 'Green House',
    this.brandTextSize = TextSizes.large,
    this.backgroundColor = Colors.transparent,
    this.imageOverlayColor = TColors.black,
    this.imageBackgroundColor = Colors.transparent,
    this.subtitle,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.betweenSpacing = TSizes.spaceBtwItems / 6,
    this.maxLines = 1,
  });

  final String title;
  final bool showBorder;
  final VoidCallback? onTap;
  final String imagePath;
  final String brandName;
  final TextSizes brandTextSize;
  final Color backgroundColor;
  final Color imageOverlayColor;
  final Color imageBackgroundColor;
  final String? subtitle;
  final EdgeInsets padding;
  final double betweenSpacing;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: padding,
        showBorder: showBorder,
        backgroundColor: backgroundColor,
        childe: Row(
          children: [
            // Image/Icon
            Flexible(
              child: CirculaerImage(
                isNetworkImage: false,
                image: imagePath,
                backgroundColor: imageBackgroundColor,
                overLayColor: imageOverlayColor,
              ),
            ),
            SizedBox(width: betweenSpacing),

            // Text Content
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProviderNameWithVerifiedIcon(
                    title: brandName,
                    brandTextSize: brandTextSize,
                  ),
                  if (subtitle != null) ...[
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: betweenSpacing / 2),
                  ],
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
