import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';
import 'package:khedma_link/navigation_menu.dart';
import 'package:khedma_link/screens/recruite_page/recruiter_navigation_menu.dart';
import 'package:khedma_link/screens/welcome/components/background.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({super.key});

  void _handleUserSelection(BuildContext context, bool isRecruiter) {
    if (isRecruiter) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RecruiterNavigationMenu(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationMenu(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'WELCOME TO KHEDMA LINK',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.01),
            Image.asset(
              'assets/images/khedmaLink.png',
              height: 299,
              width: 300,
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Freelancer Container
                  GestureDetector(
                    onTap: () => _handleUserSelection(context, false),
                    child: RoundedContainer(
                      backgroundColor: Colors.white,
                      width: 180,
                      height: 230,
                      padding: const EdgeInsets.all(7),
                      margin: const EdgeInsets.all(8),
                      childe: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          children: [
                            const SizedBox(height: TSizes.defaultSpace),
                            Image.asset(
                              "assets/images/freelancer.png",
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Freelancer',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Recruiter Container
                  GestureDetector(
                    onTap: () => _handleUserSelection(context, true),
                    child: RoundedContainer(
                      backgroundColor: Colors.white,
                      width: 180,
                      height: 230,
                      padding: const EdgeInsets.all(7),
                      margin: const EdgeInsets.all(8),
                      childe: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          children: [
                            const SizedBox(height: TSizes.defaultSpace),
                            Image.asset(
                              "assets/images/rec.png",
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Recruiter',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
