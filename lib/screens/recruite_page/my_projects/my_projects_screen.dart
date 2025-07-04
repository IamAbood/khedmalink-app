import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/recruite_page/my_projects/my_project_todo.dart';

class MyProjectsScreen extends StatefulWidget {
  final String initialFilter;
  const MyProjectsScreen({super.key, this.initialFilter = 'all'});

  @override
  State<MyProjectsScreen> createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  final Freelancer freelancer = const Freelancer(
    name: 'John Doe',
    role: 'Flutter Developer',
    offeredPrice: '\$50/hour',
  );

  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'Mobile App Development',
      'description': 'Build a Flutter e-commerce app with Firebase backend',
      'price': '\$70 per hour',
      'status': 'done',
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
      'status': 'in_progress',
    },
  ];

  final List<Map<String, String>> _filters = [
    {'key': 'all', 'label': 'All'},
    {'key': 'in_progress', 'label': 'In Progress'},
    {'key': 'done', 'label': 'Done'},
  ];

  late String _selectedFilterKey;

  final Map<String, String> _statusLabels = {
    'in_progress': 'In Progress',
    'done': 'Completed',
  };

  final Map<String, IconData> _statusIcons = {
    'in_progress': Icons.timelapse,
    'done': Icons.check_circle,
  };

  final Map<String, Color> _statusColors = {
    'in_progress': Colors.orange,
    'done': Colors.green,
  };

  @override
  void initState() {
    super.initState();
    _selectedFilterKey = widget.initialFilter;
    final newProject = Get.arguments;
    if (newProject != null) {
      _projects.insert(0, newProject);
    }
  }

  void _markProjectDone(int index) {
    setState(() {
      _projects[index]['status'] = 'done';
    });
  }

  List<Map<String, dynamic>> get _visibleProjects {
    if (_selectedFilterKey == 'all') return _projects;
    return _projects
        .where((project) => project['status'] == _selectedFilterKey)
        .toList();
  }

  Widget _statusCircle(String status) {
    final color = _statusColors[status] ?? Colors.black;
    final icon = _statusIcons[status] ?? Icons.help;

    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // ignore: deprecated_member_use
        color: color.withOpacity(0.2),
        border: Border.all(color: color, width: 2),
      ),
      child: Icon(icon, color: color, size: 16),
    );
  }

  Widget _styledText(String text, TextStyle? style, bool highlight) {
    return Text(
      text,
      style: style?.copyWith(
        color: highlight ? Colors.green[800] : style.color,
        fontWeight: highlight ? FontWeight.bold : style.fontWeight,
      ),
    );
  }

  Widget _buildFilterChips() {
    return Wrap(
      spacing: 8,
      children: _filters.map((filter) {
        final isSelected = _selectedFilterKey == filter['key'];
        return ChoiceChip(
          label: Text(filter['label']!),
          selected: isSelected,
          onSelected: (_) => setState(() {
            _selectedFilterKey = filter['key']!;
          }),
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

  Widget _buildProjectCard(Map<String, dynamic> project, int index) {
    final status = project['status'] as String;
    final isDone = status == 'done';
    final globalIndex = _projects.indexOf(project);

    return GestureDetector(
      onTap: status == 'in_progress'
          ? () async {
              await Get.to(
                () => MyProjectTodo(
                  projectId: globalIndex.toString(),
                  projectTitle: project['title'],
                  freelancer: freelancer,
                  onProjectFinished: () => _markProjectDone(globalIndex),
                ),
              );
              setState(() {});
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: _statusColors[status]?.withOpacity(0.05) ?? Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: _statusColors[status] ?? Colors.black12, width: 1.5),
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
            _statusCircle(status),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _styledText(
                        project['title'],
                        Theme.of(context).textTheme.titleMedium,
                        isDone,
                      ),
                      const Spacer(),
                      _styledText(
                        project['price'],
                        Theme.of(context).textTheme.titleSmall,
                        isDone,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _styledText(
                    project['description'],
                    Theme.of(context).textTheme.bodyMedium,
                    isDone,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(_statusIcons[status],
                          color: _statusColors[status], size: 16),
                      const SizedBox(width: 4),
                      Text(
                        _statusLabels[status] ?? '',
                        style: TextStyle(
                          color: _statusColors[status],
                          fontWeight: FontWeight.bold,
                        ),
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

  @override
  Widget build(BuildContext context) {
    final projects = _visibleProjects;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "My Projects",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildFilterChips(),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: projects.isEmpty
                  ? Center(
                      child: Text(
                        'No projects found',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : ListView.separated(
                      itemCount: projects.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
                      itemBuilder: (context, index) =>
                          _buildProjectCard(projects[index], index),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
