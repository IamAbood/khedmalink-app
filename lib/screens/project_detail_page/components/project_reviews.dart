import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/project_detail_page/components/overall_rating.dart';
import 'package:khedma_link/screens/project_detail_page/components/rating_indicator.dart';
import 'package:khedma_link/screens/project_detail_page/components/user_review_card.dart';

class ProjectReviewsScreen extends StatelessWidget {
  const ProjectReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the app bar
      appBar: AppBar(
        title: const Text('Reviews & Ratings'),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and reviews are verified and from people who worked with the this freelancer'),
              const SizedBox(height: TSizes.spaceBtwItems),

              //overall rating
              const OverallRating(),
              const RatingBarIndicators(rating: 3.5),
              Text('139', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              //user rev list

              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
