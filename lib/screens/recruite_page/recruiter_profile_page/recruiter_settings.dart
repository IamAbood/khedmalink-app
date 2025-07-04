import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/widgets/appbar/appbar.dart';
import 'package:khedma_link/screens/home_page/components/primary_header_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/profile_page/components/add_portfolio_screen.dart';
import 'package:khedma_link/screens/profile_page/components/settings_menu.dart';
import 'package:khedma_link/screens/profile_page/components/user_profile_title.dart';
import 'package:khedma_link/screens/profile_page/profile_screen.dart';
import 'package:khedma_link/screens/welcome/welcome_screen.dart';

class RecruiterSettings extends StatelessWidget {
  const RecruiterSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //the header will be here
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //appbar
                  TAppBar(
                    showBackArrow: false,
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: TColors.white,
                          ),
                    ),
                  ),

                  //user profile
                  UserProfileTitle(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),
            //body will be here
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // account settings
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  SettingsMenu(
                    icon: Iconsax.card_receive,
                    title: 'Portfolio Link',
                    subTitle: "Set your portfolio",
                    onTap: () async {
                      final portfolioLink =
                          await Get.to(() => const AddPortfolioScreen());
                      if (portfolioLink != null) {
                        debugPrint('New portfolio: $portfolioLink');
                      }
                    },
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.offAll(() => const WelcomeScreen());
                      },
                      child: const Text('Logout'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
