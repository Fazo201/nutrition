import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedTime = "Newest";
  int selectedRate = 4;
  String selectedCategory = "Local Dish";

  Widget _buildFilterOption(String text, String group, dynamic value) {
    var isSelected = false;
    if (group == "time") isSelected = (value == selectedTime);
    if (group == "rate") isSelected = (value == selectedRate);
    if (group == "category") isSelected = (value == selectedCategory);

    return RawChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF129575), // Set text color
            ),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.star, // Tick icon
            color: isSelected ? Colors.white : const Color(0xFF129575), // Change color based on selection
            size: 18.sp, // Adjust icon size if needed
          ),
        ],
      ),
      selected: isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Set border radius to 10
        side: const BorderSide(
          color: Color(0xFF129575), // Set border color
        ),
      ),
      selectedColor: Color(0xFF129575), // Set background color when selected
      backgroundColor: Colors.white, // Ensure unselected chip has no color
      showCheckmark: false, // Remove the default left checkmark
      onSelected: (selected) {
        setState(() {
          if (group == "time") selectedTime = value;
          if (group == "rate") selectedRate = value;
          if (group == "category") selectedCategory = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: REdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text("Filter Search", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const SizedBox(height: 20),
          const Text("Time", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
          Wrap(
            spacing: 10,
            children: [
              _buildFilterOption("All", "time", "All"),
              _buildFilterOption("Newest", "time", "Newest"),
              _buildFilterOption("Oldest", "time", "Oldest"),
              _buildFilterOption("Popularity", "time", "Popularity"),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Rate", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
          Wrap(
            spacing: 10,
            children: [
              _buildFilterOption("5", "rate", 5),
              _buildFilterOption("4", "rate", 4),
              _buildFilterOption("3", "rate", 3),
              _buildFilterOption("2", "rate", 2),
              _buildFilterOption("1", "rate", 1),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Category", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
          Wrap(
            spacing: 10,
            children: [
              _buildFilterOption("All", "category", "All"),
              _buildFilterOption("Cereal", "category", "Cereal"),
              _buildFilterOption("Vegetables", "category", "Vegetables"),
              _buildFilterOption("Dinner", "category", "Dinner"),
              _buildFilterOption("Chinese", "category", "Chinese"),
              _buildFilterOption("Local Dish", "category", "Local Dish"),
              _buildFilterOption("Fruit", "category", "Fruit"),
              _buildFilterOption("Breakfast", "category", "Breakfast"),
              _buildFilterOption("Spanish", "category", "Spanish"),
              _buildFilterOption("Chinese", "category", "Chinese"),
              _buildFilterOption("Lunch", "category", "Lunch"),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: MaterialButton(
              height: 37.h,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              color: AppColors.c129575,
              minWidth: 174.w,
              onPressed: () {
                // Apply filters and close bottom sheet
                Navigator.pop(context);
              },
              child: const Text("Filter",style: TextStyle(color: AppColors.white),),
            ),
          ),
        ],
      ),
    ),
  );
}
