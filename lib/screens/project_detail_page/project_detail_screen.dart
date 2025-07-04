import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';

class ProjectDetail extends StatefulWidget {
  final String projectId;
  final String title;
  final String description;
  final double suggestedPrice;

  const ProjectDetail({
    super.key,
    required this.projectId,
    required this.title,
    required this.description,
    required this.suggestedPrice,
  });

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
        backgroundColor: TColors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Title
            Text(
              widget.title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Price
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.md,
                vertical: TSizes.xs,
              ),
              decoration: BoxDecoration(
                color: buttounColor,
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              ),
              child: Text(
                '\$${widget.suggestedPrice.toStringAsFixed(2)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: TColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Description Section
            Text(
              'Description',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TSizes.sm),
            Text(
              widget.description,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Skills Section
            Text(
              'Required Skills',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: TSizes.sm),
            Wrap(
              spacing: TSizes.sm,
              runSpacing: TSizes.sm,
              children: [
                _buildSkillChip('Flutter'),
                _buildSkillChip('Dart'),
                _buildSkillChip('Firebase'),
                _buildSkillChip('UI/UX'),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _applyForProject,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                  backgroundColor: buttounColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  ),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      backgroundColor: TColors.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.sm),
      ),
    );
  }

  void _applyForProject() {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Application submitted successfully"),
      ),
    );
  }
}
