import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedTime = 'Newest';
  int selectedRate = 4;
  String selectedCategory = 'Local Dish';

  Widget _buildFilterOption(String text, String group, dynamic value) {
    bool isSelected = false;
    if (group == 'time') isSelected = (value == selectedTime);
    if (group == 'rate') isSelected = (value == selectedRate);
    if (group == 'category') isSelected = (value == selectedCategory);

    return ChoiceChip(
      label: Text(text),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (group == 'time') selectedTime = value;
          if (group == 'rate') selectedRate = value;
          if (group == 'category') selectedCategory = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Filter Search', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text('Time', style: TextStyle(fontSize: 16)),
            Wrap(
              spacing: 10.0,
              children: [
                _buildFilterOption('All', 'time', 'All'),
                _buildFilterOption('Newest', 'time', 'Newest'),
                _buildFilterOption('Oldest', 'time', 'Oldest'),
                _buildFilterOption('Popularity', 'time', 'Popularity'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Rate', style: TextStyle(fontSize: 16)),
            Wrap(
              spacing: 10.0,
              children: [
                _buildFilterOption('5', 'rate', 5),
                _buildFilterOption('4', 'rate', 4),
                _buildFilterOption('3', 'rate', 3),
                _buildFilterOption('2', 'rate', 2),
                _buildFilterOption('1', 'rate', 1),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Category', style: TextStyle(fontSize: 16)),
            Wrap(
              spacing: 10.0,
              children: [
                _buildFilterOption('All', 'category', 'All'),
                _buildFilterOption('Cereal', 'category', 'Cereal'),
                _buildFilterOption('Vegetables', 'category', 'Vegetables'),
                _buildFilterOption('Dinner', 'category', 'Dinner'),
                _buildFilterOption('Chinese', 'category', 'Chinese'),
                _buildFilterOption('Local Dish', 'category', 'Local Dish'),
                _buildFilterOption('Fruit', 'category', 'Fruit'),
                _buildFilterOption('Breakfast', 'category', 'Breakfast'),
                _buildFilterOption('Spanish', 'category', 'Spanish'),
                _buildFilterOption('Chinese', 'category', 'Chinese'),
                _buildFilterOption('Lunch', 'category', 'Lunch'),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Apply filters and close bottom sheet
                  Navigator.pop(context);
                },
                child: const Text('Filter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}