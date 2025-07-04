import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/recruite_page/components/pending_list.dart';

class PendingProjectsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> pendingProjects;
  final List<Map<String, dynamic>> activeProjects;

  const PendingProjectsScreen({
    super.key,
    required this.pendingProjects,
    required this.activeProjects,
  });

  @override
  State<PendingProjectsScreen> createState() => _PendingProjectsScreenState();
}

class _PendingProjectsScreenState extends State<PendingProjectsScreen> {
  late List<Map<String, dynamic>> pendingProjects;
  late List<Map<String, dynamic>> activeProjects;

  @override
  void initState() {
    super.initState();
    pendingProjects = widget.pendingProjects;
    activeProjects = widget.activeProjects;
  }

  void _removeProject(int index) {
    setState(() {
      pendingProjects.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Projects'),
        backgroundColor: TColors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PendingProjectsList(
          pendingProjects: pendingProjects,
          activeProjects: activeProjects,
          onRemoveProject: _removeProject,
        ),
      ),
    );
  }
}
