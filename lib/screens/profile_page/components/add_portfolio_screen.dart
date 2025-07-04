import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khedma_link/constants/colors.dart';

class AddPortfolioScreen extends StatefulWidget {
  const AddPortfolioScreen({super.key});

  @override
  State<AddPortfolioScreen> createState() => _AddPortfolioScreenState();
}

class _AddPortfolioScreenState extends State<AddPortfolioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _portfolioController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _portfolioController.dispose();
    super.dispose();
  }

  Future<void> _submitPortfolio() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate network call
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);
    Get.back(result: _portfolioController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Portfolio Link',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: TColors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: _submitPortfolio,
              child: Text(
                'SAVE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Share your work',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add a link to your portfolio website or project',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _portfolioController,
                decoration: InputDecoration(
                  labelText: 'Portfolio URL',
                  hintText: 'https://yourportfolio.com',
                  prefixIcon: const Icon(Icons.link_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                ),
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your portfolio link';
                  }
                  if (!Uri.tryParse(value)!.hasAbsolutePath) {
                    return 'Please enter a valid URL (include https://)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              if (!_isLoading)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitPortfolio,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      'Save Portfolio',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Icon(Icons.info_outline, size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Make sure your portfolio is publicly accessible',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
