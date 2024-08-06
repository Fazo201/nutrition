import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/style/app_colors.dart';
import '../widgets/filter_search_widget.dart';
import '../widgets/search_recipes_item_widget.dart';
import '../widgets/search_recipes_text_field_button_widget.dart';

class SearchRecipesPage extends StatefulWidget {
  SearchRecipesPage({super.key});

  @override
  State<SearchRecipesPage> createState() => _SearchRecipesPageState();
}

class _SearchRecipesPageState extends State<SearchRecipesPage> {
  /// The list of dishes names
  final List<String> recentSearches = [
    'Traditional spare ribs baked',
    'Lamb chops with fruity couscous and mint',
    'Spice roasted chicken with flavored rice',
    'Chinese style Egg fried rice with sliced pork',
    'Traditional spare ribs baked',
    'Lamb chops with fruity couscous and mint',
    'Spice roasted chicken with flavored rice',
    'Chinese style Egg fried rice with sliced pork'
  ];

  /// useful variables
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  List<String> _results = [];
  int _totalResults = 0;

  /// Functions

  // function to show the amount of results
  void _performSearch() {
    String query = _controller.text;

    setState(() {
      _results = List<String>.generate(10, (index) => 'Result ${index + 1} for "$query"');
      _totalResults = 255; // This is just a static example, replace with actual result count.
    });
    FocusScope.of(context).unfocus();
  }

  // function to show the bottom sheet
  void _showFilterBottomSheet(BuildContext context) {
    FocusScope.of(context).unfocus();
    _focusNode.unfocus();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6, // 60% of the screen height
          child: const FilterBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(milliseconds: 100), () {
    //   FocusScope.of(context).requestFocus(_focusNode);
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search recipes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// text field and button
            SearchRecipesTextFieldButtonWidget(
              focusNode: _focusNode,
              controller: _controller,
              onSubmitted: (value) => _performSearch(),
              // onTapFilter: () => _showFilterBottomSheet(context),
            ),
            const SizedBox(height: 16.0),

            /// two texts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Search',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                _totalResults != 0
                    ? Text('$_totalResults results', style: const TextStyle(fontSize: 14, color: AppColors.cA9A9A9))
                    : const Text("")
              ],
            ),
            const SizedBox(height: 16.0),
            /// the cards (The dishes)
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: recentSearches.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                    title: recentSearches[index],
                    imageUrl: 'assets/images/search_page_cook_image.png', // Placeholder image URL
                    rating: '4.0',
                    author: 'Chef John',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
