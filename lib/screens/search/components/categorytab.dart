import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';
import 'package:khedma_link/screens/search/components/project_card.dart';

class CategoryTab extends StatelessWidget {
  final String searchQuery;
  final List<Freelancer> freelancers;

  const CategoryTab({
    super.key,
    required this.searchQuery,
    required this.freelancers,
  });

  @override
  Widget build(BuildContext context) {
    final filteredProjects = freelancers
        .where((freelancer) =>
            freelancer.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
            freelancer.role.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.spaceBtwItems,
      ),
      child: filteredProjects.isEmpty
          ? _buildEmptyState(context)
          : ListView.builder(
              itemCount: filteredProjects.length,
              itemBuilder: (context, index) {
                final freelancer = filteredProjects[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                  child: Stack(
                    children: [
                      // Make the entire ProjectCard clickable
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProjectDetail(
                                projectId: '1',
                                title: "flutter developer",
                                description: "looking for flutter developer",
                                suggestedPrice: 200,
                              ),
                            ),
                          );
                        },
                        child: ProjectCard(freelancer: freelancer),
                      ),
                      // Apply button on top
                      Positioned(
                        bottom: 12,
                        right: 12,
                        child: ElevatedButton(
                          onPressed: () {
                            _showApplyDialog(context, freelancer);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            backgroundColor: buttounColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  void _showApplyDialog(BuildContext context, Freelancer freelancer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Apply for ${freelancer.role}"),
        content: const Text("Are you sure you want to apply for this project?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: buttounColor,
            ),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Application submitted successfully"),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: buttounColor,
            ),
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.work_outline, size: 64, color: Colors.grey[400]),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            'No projects found',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Text(
            searchQuery.isEmpty
                ? 'Check back later for new projects'
                : 'No matches for "$searchQuery"',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
          ),
        ],
      ),
    );
  }
}
