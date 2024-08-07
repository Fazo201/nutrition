import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/style/app_colors.dart';
import '../widgets/search_recipes_item_widget.dart';

class SearchRecipesPage extends StatelessWidget {
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

  SearchRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search recipes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search recipe',
                      hintStyle: const TextStyle(color: AppColors.cD9D9D9),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: SvgPicture.asset('assets/icons/search_in_textfield_icon.svg'),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                      border: const OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: AppColors.c129575),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset('assets/icons/filter_icon.svg'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Recent Search',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 16.0),
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
