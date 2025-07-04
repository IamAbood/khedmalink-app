import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';
import 'package:khedma_link/screens/recruite_page/add_projects/add_screen.dart';

class AddProjectsScreen extends StatefulWidget {
  const AddProjectsScreen({super.key});

  @override
  State<AddProjectsScreen> createState() => _AddProjectsScreenState();
}

class _AddProjectsScreenState extends State<AddProjectsScreen> {
  List<Map<String, dynamic>> projects = [
    {
      'title': 'Mobile App Development',
      'description': 'Build a Flutter e-commerce app with Firebase backend',
      'price': '\$70 per hour',
      'status': 'in_progress',
    },
    {
      'title': 'Website Redesign',
      'description': 'Modern redesign for corporate website',
      'price': '\$60 per hour',
      'status': 'in_progress',
    },
    {
      'title': 'Logo Design',
      'description': 'Create brand identity for startup',
      'price': '\$30 per hour',
      'status': 'in_progress',
    },
    {
      'title': 'SEO Optimization',
      'description': 'Improve search rankings for existing site',
      'price': '\$55 per hour',
      'status': 'in_progress',
    },
  ];

  Widget _statusCircle() {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // ignore: deprecated_member_use
        color: Colors.yellow.withOpacity(0.2),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: const Icon(Icons.timelapse, size: 16, color: Colors.orange),
    );
  }

  Color _backgroundColor() {
    // ignore: deprecated_member_use
    return Colors.yellow.withOpacity(0.05);
  }

  Color _borderColor() {
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Create Projects",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await Get.to(const AddScreen());
              if (result != null) {
                setState(() {
                  projects.add(result);
                });
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: projects.isEmpty
            ? Center(
                child: Text(
                  "No projects available.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            : ListView.separated(
                itemCount: projects.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final project = projects[index];
                  final price = project['price'] as String;
                  final title = project['title'] as String;
                  final description = project['description'] as String;

                  return GestureDetector(
                    onTap: () {
                      final priceString =
                          price.replaceAll(RegExp(r'[^0-9.]'), '');
                      final priceValue = double.tryParse(priceString) ?? 0.0;

                      Get.to(() => ProjectDetail(
                            description: description,
                            projectId: index.toString(),
                            suggestedPrice: priceValue,
                            title: title,
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _backgroundColor(),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _borderColor(),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          _statusCircle(),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Spacer(),
                                    Text(
                                      price,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  description,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
