import 'package:flutter/material.dart';
import 'package:khedma_link/model/freelancer_model.dart';
import 'package:khedma_link/screens/project_detail_page/project_detail_screen.dart';
import 'package:khedma_link/constants/widgets/rounded_container.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.freelancer,
  });

  final Freelancer freelancer;

  static const List<Map<String, String>> categories = [
    {'title': 'UI/UX Designer is Needed', 'id': '0'},
    {'title': 'App Developer', 'id': '1'},
    {'title': 'SEO Specialist', 'id': '2'},
    {'title': 'Content Writer', 'id': '3'},
    {'title': 'Graphic Designer', 'id': '4'},
    {'title': 'Data Analyst', 'id': '5'},
    {'title': 'Project Manager', 'id': '6'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return RoundedContainer(
            width: 190,
            height: 90,
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(12), // Adjusted padding
            margin: const EdgeInsets.symmetric(vertical: 8),
            childe: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectDetail(
                    description: "UI/UX designer is needed for a big project",
                    projectId: "12",
                    suggestedPrice: 26,
                    title: "UI/UX",
                  ),
                ),
              ),
              child: Center(
                // Centered text
                child: Text(
                  category['title']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
