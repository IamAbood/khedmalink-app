import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/widgets/appbar/appbar.dart';
import 'package:khedma_link/constants/widgets/menu_icon.dart';

class HomeTAppBar extends StatelessWidget {
  const HomeTAppBar({
    super.key,
    required this.titleText,
    required this.subtitleText,
    required this.avatarImage,
  });

  final String titleText;
  final String subtitleText;
  final String? avatarImage;

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Row(
        children: [
          _buildAvatar(context),
          const SizedBox(width: TSizes.spaceBtwItems),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titleText,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: TColors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: TSizes.xs),
              Text(
                subtitleText,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: TColors.grey,
                    ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        MenuIcon(
          onPressed: () {},
          iconColor: TColors.dark,
        ),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 54,
      child: avatarImage != null
          ? ClipOval(
              child: Image.asset(
                avatarImage!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildDefaultAvatar(),
              ),
            )
          : _buildDefaultAvatar(),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      decoration: const BoxDecoration(
        color: TColors.light,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.person,
          size: 24,
          color: TColors.dark,
        ),
      ),
    );
  }
}
