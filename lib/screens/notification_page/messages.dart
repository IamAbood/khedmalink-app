import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/helper_class/prouduct_title_text.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/brand_name.dart';

class Messages extends StatelessWidget {
  const Messages({
    super.key,
    required this.id,
    required this.onDelete,
    this.time = '10:30 AM',
    this.onTap,
  });

  final int id;
  final VoidCallback onDelete;
  final String time;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      // ignore: deprecated_member_use
      splashColor: TColors.primary.withOpacity(0.15),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.spaceBtwItems * 1.5,
          vertical: TSizes.spaceBtwItems,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.7),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.3,
          ),
        ),
        child: Row(
          children: [
            // Message content
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: ProviderNameWithVerifiedIcon(
                          title: 'Green House',
                        ),
                      ),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Flexible(
                    child: ProductTitleText(
                      title: "Razan just sent an Email",
                      maxLines: 1,
                      smallSize: true,
                    ),
                  ),
                ],
              ),
            ),

            // Delete button with better spacing
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: IconButton(
                icon: Icon(
                  Iconsax.trash,
                  size: 22,
                  color: Colors.red.shade600,
                ),
                onPressed: onDelete,
                splashRadius: 22,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                tooltip: 'Delete message',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
