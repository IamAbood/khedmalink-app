import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/recruite_page/add_projects/add_screen.dart';
import 'package:khedma_link/screens/recruite_page/my_projects/my_projects_screen.dart';
import 'package:khedma_link/screens/recruite_page/recruiter_home_screen.dart';
import 'package:khedma_link/screens/recruite_page/recruiter_profile_page/recruiter_settings.dart';

class RecruiterNavigationMenu extends StatelessWidget {
  const RecruiterNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationControllerrecruiter());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          // ignore: deprecated_member_use
          indicatorColor: TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Iconsax.profile_2user), label: 'My Projects'),
            NavigationDestination(
                icon: Icon(Iconsax.add_square4), label: 'Create Projects '),
            NavigationDestination(icon: Icon(Iconsax.home_24), label: 'home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationControllerrecruiter extends GetxController {
  final Rx<int> selectedIndex = 2.obs;

  final screens = [
    const MyProjectsScreen(),
    const AddScreen(),
    const RecruiterHomeScreen(),
    const RecruiterSettings(),
  ];
}
