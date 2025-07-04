import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/menu_icon.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/todo_home.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final Freelancer freelancer = const Freelancer(
    name: 'Sami',
    role: 'Flutter Developer',
    offeredPrice: '\$70/hour',
  );

  // ignore: prefer_final_fields
  List<Map<String, dynamic>> _projects = [
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
      'status': 'done',
    },
    {
      'title': 'SEO Optimization',
      'description': 'Improve search rankings for existing site',
      'price': '\$55 per hour',
      'status': 'done',
    },
  ];

  final List<Map<String, String>> _filters = [
    {'key': 'all', 'label': 'All'},
    {'key': 'in_progress', 'label': 'In Progress'},
    {'key': 'done', 'label': 'Done'},
  ];

  late String _selectedFilter = 'all';

  final Map<String, IconData> _statusIcons = {
    'in_progress': Icons.timelapse,
    'done': Icons.timelapse,
  };

  final Map<String, Color> _statusColors = {
    'in_progress': Colors.orange,
    'done': Colors.green,
  };

  List<Map<String, dynamic>> get _visibleProjects {
    if (_selectedFilter == 'all') return _projects;
    return _projects.where((p) => p['status'] == _selectedFilter).toList();
  }

  Widget _buildFilterChips() {
    return Wrap(
      spacing: 8,
      children: _filters.map((filter) {
        final isSelected = _selectedFilter == filter['key'];
        return ChoiceChip(
          label: Text(filter['label']!),
          selected: isSelected,
          onSelected: (_) {
            setState(() {
              _selectedFilter = filter['key']!;
            });
          },
          selectedColor: buttounColor,
          backgroundColor: Colors.grey[200],
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    final status = project['status'] as String;
    final isDone = status == 'done';
    final index = _projects.indexOf(project);

    return GestureDetector(
      onTap: status == 'in_progress'
          ? () async {
              await Get.to(
                () => TodoHomeScreen(
                  projectId: index.toString(),
                  projectTitle: project['title'],
                  freelancer: freelancer,
                ),
              );
              setState(() {});
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(16), // same as original ProjectScreen
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              _statusIcons[status],
              color: _statusColors[status],
              size: 20,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          project['title'],
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isDone ? Colors.green[800] : null,
                                  ),
                        ),
                      ),
                      Text(
                        project['price'],
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: TColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project['description'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDone ? Colors.green[800] : null,
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

  @override
  Widget build(BuildContext context) {
    final projects = _visibleProjects;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Projects",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          MenuIcon(onPressed: () {}, iconColor: Colors.black),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildFilterChips(),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: projects.isEmpty
                  ? Center(
                      child: Text(
                        'No projects found.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : ListView.separated(
                      itemCount: projects.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) =>
                          _buildProjectCard(projects[index]),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
