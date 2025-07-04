import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/home_appbar.dart';
import 'package:khedma_link/screens/home_page/components/home_categoeies.dart';
import 'package:khedma_link/screens/home_page/components/list_of_projects.dart';
import 'package:khedma_link/screens/home_page/components/primary_header_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const freelancer = Freelancer(
      name: "Jack",
      role: "Flutter Developer",
      offeredPrice: "\$70/hour",
    );
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTAppBar(
                    subtitleText: "Freelancer",
                    titleText: "sami",
                    avatarImage: 'assets/images/avatar.jpg',
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'New Projects',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        HomeCategories(freelancer: freelancer),
                        SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  SectionHeading(
                    title: 'Pending projects',
                    onPressed: null,
                    showActionButton: false,
                  ),
                  ListOfProject(
                    freelancer: freelancer,
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
