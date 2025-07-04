import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/home_page/home_screen.dart';
import 'package:khedma_link/screens/profile_page/settings.dart';
import 'package:khedma_link/screens/project_page/project_screen.dart';
import 'package:khedma_link/screens/search/search_page.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

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
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(
                icon: Icon(Icons.dashboard), label: 'Projects'),
            NavigationDestination(icon: Icon(Icons.person_2), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 1.obs;

  final screens = [
    const SearchPage(),
    const HomeScreen(),
    const ProjectScreen(),
    const SettingsScreen(),
  ];
}
