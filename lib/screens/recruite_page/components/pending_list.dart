import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/recruite_page/project_applicants/project_applicants_screen.dart';

class PendingProjectsList extends StatelessWidget {
  final List<Map<String, dynamic>> pendingProjects;
  final List<Map<String, dynamic>> activeProjects;
  final Function(int) onRemoveProject;

  const PendingProjectsList({
    super.key,
    required this.pendingProjects,
    required this.activeProjects,
    required this.onRemoveProject,
  });

  @override
  Widget build(BuildContext context) {
    if (pendingProjects.isEmpty) {
      return const Center(
        child: Text(
          'No pending projects available',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pendingProjects.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (context, index) {
        final project = pendingProjects[index];
        final applicantsCount = project['applicants'].length;

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => _navigateToApplicantsScreen(context, project, index),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        project['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        project['price'],
                        style: const TextStyle(
                          color: TColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Project Description
                  Text(
                    project['description'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Applicants Info
                  Row(
                    children: [
                      const Icon(
                        Icons.people_outline,
                        size: 16,
                        color: TColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$applicantsCount ${applicantsCount == 1 ? 'applicant' : 'applicants'}',
                        style: const TextStyle(
                          color: TColors.primary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToApplicantsScreen(
      BuildContext context, Map<String, dynamic> project, int projectIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectApplicantsScreen(
          projectId: project['id'],
          projectTitle: project['title'],
          projectDescription: project['description'],
          projectPrice: project['price'],
          applicants: List.from(project['applicants']),
          onAccept: (applicant) {
            // Move project to active when applicant is accepted
            activeProjects.add({
              'projectId': project['id'],
              'title': project['title'],
              'applicant': applicant,
              'status': 'active',
            });
            onRemoveProject(projectIndex);
          },
          onReject: (applicantIndex) {
            // Remove applicant from the list
            pendingProjects[projectIndex]['applicants']
                .removeAt(applicantIndex);

            // Remove project if no applicants left
            if (pendingProjects[projectIndex]['applicants'].isEmpty) {
              onRemoveProject(projectIndex);
            }
          },
        ),
      ),
    );
  }
}
