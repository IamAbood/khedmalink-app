import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.controller,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    this.onChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final TextEditingController controller;
  final IconData? icon;
  final bool showBackground, showBorder;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: showBackground ? TColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(9.0),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: TColors.darkerGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: 'Search for service',
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
