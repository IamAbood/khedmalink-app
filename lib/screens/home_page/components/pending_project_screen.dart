import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';

enum ApplicationStatus { accepted, waiting, rejected }

class PendingProject {
  final String projectName;
  final String description;
  final ApplicationStatus status;

  PendingProject({
    required this.projectName,
    required this.description,
    required this.status,
  });
}

class PendingProjectScreen extends StatelessWidget {
  final PendingProject pendingProject;

  const PendingProjectScreen({super.key, required this.pendingProject});

  Color _getStatusColor(ApplicationStatus status) {
    switch (status) {
      case ApplicationStatus.accepted:
        return Colors.green;
      case ApplicationStatus.waiting:
        return Colors.orange;
      case ApplicationStatus.rejected:
        return Colors.red;
    }
  }

  IconData _getStatusIcon(ApplicationStatus status) {
    switch (status) {
      case ApplicationStatus.accepted:
        return Icons.check_circle_outline;
      case ApplicationStatus.waiting:
        return Icons.hourglass_empty;
      case ApplicationStatus.rejected:
        return Icons.cancel_outlined;
    }
  }

  String _getStatusText(ApplicationStatus status) {
    switch (status) {
      case ApplicationStatus.accepted:
        return "Accepted";
      case ApplicationStatus.waiting:
        return "Waiting";
      case ApplicationStatus.rejected:
        return "Rejected";
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(pendingProject.status);
    final statusIcon = _getStatusIcon(pendingProject.status);
    final statusText = _getStatusText(pendingProject.status);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Pending Project'),
        backgroundColor: TColors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(TSizes.md),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // ignore: deprecated_member_use
                          color: statusColor.withOpacity(0.1),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Icon(statusIcon, color: statusColor, size: 28),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pendingProject.projectName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: TColors.primary,
                                  ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              pendingProject.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.grey[800],
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Submit action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttounColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Submit Application',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
