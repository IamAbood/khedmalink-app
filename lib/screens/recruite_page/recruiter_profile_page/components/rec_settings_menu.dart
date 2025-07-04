import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';

class RecSettingsMenu extends StatelessWidget {
  const RecSettingsMenu(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColors.black,
      ),
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: buttounColor)),
      subtitle: Text(subTitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .apply(color: buttounColor)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
