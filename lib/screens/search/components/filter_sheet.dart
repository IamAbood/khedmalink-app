import 'package:flutter/material.dart';

class FilterSheets extends StatefulWidget {
  const FilterSheets({super.key});

  @override
  State<FilterSheets> createState() => _FilterSheetsState();
}

class _FilterSheetsState extends State<FilterSheets> {
  int? _selectedPriceIndex;
  final List<int> _priceOptions = [5, 10, 20, 50];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter by Price",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 24),

          // Price options
          Text(
            "Price Range",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              _priceOptions.length,
              (index) => ChoiceChip(
                label: Text("\$${_priceOptions[index]}"),
                selected: _selectedPriceIndex == index,
                onSelected: (selected) {
                  setState(() {
                    _selectedPriceIndex = selected ? index : null;
                  });
                },
                // ignore: deprecated_member_use
                selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
                labelStyle: TextStyle(
                  color: _selectedPriceIndex == index
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(
                  color: _selectedPriceIndex == index
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade300,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Apply button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                // Apply filter logic here
                if (_selectedPriceIndex != null) {}
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text(
                "Apply Filter",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
