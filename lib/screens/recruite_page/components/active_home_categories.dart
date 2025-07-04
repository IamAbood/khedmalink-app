import 'package:flutter/material.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/recruite_page/my_projects/my_project_todo.dart';

class ActiveHomeCategories extends StatelessWidget {
  final Freelancer freelancer;

  const ActiveHomeCategories({super.key, required this.freelancer});

  static const List<Map<String, String>> categories = [
    {'title': 'UI/UX Designer', 'id': '0'},
    {'title': 'App Developer', 'id': '1'},
    {'title': 'SEO Specialist', 'id': '2'},
    {'title': 'Content Writer', 'id': '3'},
    {'title': 'Graphic Designer', 'id': '4'},
    {'title': 'Data Analyst', 'id': '5'},
    {'title': 'Project Manager', 'id': '6'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Projects'),
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return _CategoryCard(
              title: category['title']!,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MyProjectTodo(
                    projectId: category['id']!,
                    projectTitle: category['title']!,
                    freelancer: freelancer,
                    onProjectFinished: () {},
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white, // White background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
