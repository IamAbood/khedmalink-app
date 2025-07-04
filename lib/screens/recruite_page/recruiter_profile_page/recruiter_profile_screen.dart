import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/profile_page/components/profile_menu.dart';
import 'package:khedma_link/screens/search/components/circular_image.dart';

class RecruiterProfileScreen extends StatelessWidget {
  const RecruiterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Profile',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        ),
      ),
      //the body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //profile pic
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CirculaerImage(
                      image: 'assets/images/avatar.jpg',
                      height: 80,
                      width: 80,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              //details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              //
              //
              //heading profile info
              const SectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(
                title: 'Name',
                value: 'Laith Abusamra',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'User Name',
                value: 'Laithasmar',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              //
              //
              //heading of personal info
              const SectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(
                title: 'Email',
                value: 'laithbusamra060@gmail.com',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Phone Number',
                value: '079790598',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'portfolio link',
                value: 'https://laith-portfolio4.web.app/',
                onPressed: () {},
              ),
              ProfileMenu(
                title: 'Job Title',
                value: 'Software Engineer',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
