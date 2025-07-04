import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/search/components/circular_image.dart';

class UserProfileTitle extends StatelessWidget {
  const UserProfileTitle({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CirculaerImage(
        image: 'assets/images/avatar.jpg',
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Laith Abusamra',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white)),
      subtitle: Text('laithabusamra060@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}
