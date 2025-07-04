import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/helper_class/enums.dart';
import 'package:khedma_link/constants/helper_class/product_price.dart';
import 'package:khedma_link/screens/home_page/components/home_controller_file/brand_name.dart';

class ProjectMetaData extends StatelessWidget {
  const ProjectMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price

        Row(
          children: [
            // RoundedContainer(
            //   radius: TSizes.sm,
            //   // ignore: deprecated_member_use
            //   backgroundColor: TColors.secondary.withOpacity(0.8),
            //   padding: const EdgeInsets.symmetric(
            //       horizontal: TSizes.sm, vertical: TSizes.xs),
            //   childe: Text(
            //     '25%',
            //     style: Theme.of(context).textTheme.labelLarge!.apply(
            //           color: TColors.black,
            //         ),
            //   ),
            // ),
            SizedBox(width: TSizes.spaceBtwItems),

            //price
            //  Text('\$55'style: Theme.of(context).textTheme.titleSmall!.apply(decoration:TextDirection.LineThroug ),)
            ProductPriceText(
              price: '55',
              isLarge: true,
            ),
          ],
        ),
        // SizedBox(height: TSizes.spaceBtwItems),
        //title
        // ProductTitleText(title: 'design 3d logo'),
        SizedBox(height: TSizes.spaceBtwItems),
        //provider name
        ProviderNameWithVerifiedIcon(
          title: 'Green House',
          brandTextSize: TextSizes.medium,
        )
      ],
    );
  }
}
