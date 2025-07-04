import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/welcome/freelancer_recruiter/freelancer_profile_screen.dart';

class ProjectApplicantsScreen extends StatefulWidget {
  final String projectId;
  final String projectTitle;
  final String projectDescription;
  final String projectPrice;
  final List<Map<String, dynamic>> applicants;
  final Function(Map<String, dynamic>) onAccept;
  final Function(int) onReject;

  const ProjectApplicantsScreen({
    super.key,
    required this.projectId,
    required this.projectTitle,
    required this.projectDescription,
    required this.projectPrice,
    required this.applicants,
    required this.onAccept,
    required this.onReject,
  });

  @override
  State<ProjectApplicantsScreen> createState() =>
      _ProjectApplicantsScreenState();
}

class _ProjectApplicantsScreenState extends State<ProjectApplicantsScreen> {
  late List<Map<String, dynamic>> _applicants;

  @override
  void initState() {
    super.initState();
    _applicants = List.from(widget.applicants);
  }

  Future<bool?> _showConfirmationDialog(String action, String name) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$action Applicant'),
        content: Text('Are you sure you want to $action $name?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(action),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 1,
        title: Text(widget.projectTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: _applicants.isEmpty
          ? const Center(child: Text('No applicants left.'))
          : ListView.builder(
              itemCount: _applicants.length,
              itemBuilder: (context, index) {
                final applicant = _applicants[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => FreelancerProfileScreen(
                                        phoneNumber: "07954798334",
                                        portfolioUrl:
                                            "https://exampleportfolio.com",
                                        name: applicant['name'],
                                        role: applicant['role'],
                                        offeredPrice: applicant['offeredPrice'],
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      applicant['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      applicant['role'],
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Offered Price: ${applicant['offeredPrice']}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              onPressed: () async {
                                final confirm = await _showConfirmationDialog(
                                  'Reject',
                                  applicant['name'],
                                );
                                if (confirm == true) {
                                  widget.onReject(index);
                                  setState(() => _applicants.removeAt(index));
                                }
                              },
                              child: const Text('Reject'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // ignore: deprecated_member_use
                                backgroundColor: buttounColor.withOpacity(0.9),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () async {
                                final confirm = await _showConfirmationDialog(
                                  'Accept',
                                  applicant['name'],
                                );
                                if (confirm == true) {
                                  widget.onAccept(applicant);
                                  setState(() => _applicants.removeAt(index));
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text('Accept'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
