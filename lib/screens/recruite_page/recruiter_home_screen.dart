import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/home_page/components/home_appbar.dart';
import 'package:khedma_link/screens/home_page/components/primary_header_container.dart';
import 'package:khedma_link/screens/home_page/components/section_heading.dart';
import 'package:khedma_link/screens/recruite_page/add_projects/add_screen.dart';
import 'package:khedma_link/screens/recruite_page/components/active_home_categories.dart';
import 'package:khedma_link/screens/recruite_page/components/pending_projects_screen.dart';
import 'package:khedma_link/screens/recruite_page/my_projects/my_projects_screen.dart';

class RecruiterHomeScreen extends StatefulWidget {
  const RecruiterHomeScreen({super.key});

  @override
  State<RecruiterHomeScreen> createState() => _RecruiterHomeScreenState();
}

class _RecruiterHomeScreenState extends State<RecruiterHomeScreen> {
  List<Map<String, dynamic>> pendingProjects = [
    {
      'id': '1',
      'title': 'Mobile App Development',
      'description': 'Build a Flutter e-commerce app',
      'price': '\$70/hour',
      'applicants': [
        {
          'name': 'sami',
          'role': 'Flutter Developer',
          'offeredPrice': '\$65/hour',
        },
        {
          'name': 'Sarah zaid',
          'role': 'UI/UX Designer',
          'offeredPrice': '\$60/hour',
        },
      ],
    },
    {
      'id': '2',
      'title': 'Website Redesign',
      'description': 'Modern redesign for corporate website',
      'price': '\$60/hour',
      'applicants': [
        {
          'name': 'laith',
          'role': 'UI/UX Designer',
          'offeredPrice': '\$55/hour',
        },
        {
          'name': 'Sarah zaid',
          'role': 'Web Developer',
          'offeredPrice': '\$60/hour',
        },
      ],
    },
    {
      'id': '3',
      'title': 'SEO Optimization',
      'description': 'Improve search rankings',
      'price': '\$50/hour',
      'applicants': [
        {
          'name': 'salem',
          'role': 'SEO Specialist',
          'offeredPrice': '\$45/hour',
        },
      ],
    },
  ];

  List<Map<String, dynamic>> activeProjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeTAppBar(
                    titleText: "laith",
                    subtitleText: "Reruiter",
                    avatarImage: "assets/images/avatar.jpg",
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // SectionHeading(
                        //   title: 'Active Projects',
                        //   showActionButton: false,
                        //   textColor: Colors.white,
                        // ),
                        SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.spaceBtwItems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeading(
                    title: 'Ready to Manage the Projects',
                    showActionButton: false,
                  ),

                  // Grid layout for management options
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: TSizes.spaceBtwItems,
                    crossAxisSpacing: TSizes.spaceBtwItems,
                    children: [
                      // Create Project
                      _buildManagementOption(
                        context,
                        icon: Icons.add_circle_outline,
                        title: 'Create Project',
                        color: Colors.blueAccent,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddScreen()));
                        },
                      ),

                      // Active Projects
                      _buildManagementOption(
                        context,
                        icon: Icons.work_outline,
                        title: 'Active Projects',
                        color: Colors.green,
                        count: 7,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ActiveHomeCategories(
                                        freelancer: Freelancer(
                                            name: "laith",
                                            role: 'graphic',
                                            offeredPrice: "\$90"),
                                      )));
                        },
                      ),

                      // Pending Projects
                      _buildManagementOption(
                        context,
                        icon: Icons.pending_actions,
                        title: 'Pending Projects',
                        color: Colors.orange,
                        count: 3,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PendingProjectsScreen(
                                pendingProjects: pendingProjects,
                                activeProjects: activeProjects,
                              ),
                            ),
                          );
                        },
                      ),

                      // Project History
                      _buildManagementOption(
                        context,
                        icon: Icons.history,
                        title: 'Project History',
                        color: Colors.purple,
                        count: 2,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MyProjectsScreen(initialFilter: 'done'),
                            ),
                          );
                        },
                      ),
                    ],
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

Widget _buildManagementOption(
  BuildContext context, {
  required IconData icon,
  required String title,
  required Color color,
  int? count,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: RoundedContainer(
      backgroundColor: Colors.white,
      padding: const EdgeInsets.all(TSizes.md),
      childe: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: TSizes.sm),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          if (count != null) ...[
            const SizedBox(height: TSizes.xs),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
