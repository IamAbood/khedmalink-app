import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';
import 'package:khedma_link/screens/project_detail_page/components/rating_indicator.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpg')),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('sam abusamra',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        //Riview
        Row(
          children: [
            const RatingBarIndicators(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01 Nov,2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const SizedBox(width: TSizes.spaceBtwItems),
        const ReadMoreText(
          'I have worked with him, and I have had a good experience and I would like to work with him again. and yup',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: "show less",
          trimCollapsedText: "show more",
          moreStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: buttounColor),
          lessStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: buttounColor),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        // respond to Riview
        RoundedContainer(
          backgroundColor: TColors.grey,
          childe: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Green House',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('02,Nov , 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'I have worked with him, and I have had a good experience and I would like to work with him again.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "show less",
                  trimCollapsedText: "show more",
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: buttounColor),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: buttounColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
