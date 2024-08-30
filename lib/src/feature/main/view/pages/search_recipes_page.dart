import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/core/style/text_style.dart";
import "package:nutrition/src/feature/main/view_model/search_vm.dart";
import "../widgets/search_recipes_item_widget.dart";
import "../widgets/search_recipes_text_field_button_widget.dart";

class SearchRecipesPage extends ConsumerStatefulWidget {
  const SearchRecipesPage({super.key, this.isTextField});

  final bool? isTextField;

  @override
  ConsumerState<SearchRecipesPage> createState() => _SearchRecipesPageState();
}

class _SearchRecipesPageState extends ConsumerState<SearchRecipesPage> {
  AppTextStyle style = const AppTextStyle();

  @override
  void initState() {
    super.initState();
    log(widget.isTextField.toString());
    log("InitState");

    ref.read(searchVm).checkBooleanValue(widget.isTextField, context);
  }

  @override
  Widget build(BuildContext context) {
    log("Build");

    final searchViewModel = ref.watch(searchVm);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "Search recipes",
            style: style.titleSmall?.copyWith(
              color: AppColors.c181818,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          forceMaterialTransparency: true,
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchRecipesTextFieldButtonWidget(
                  focusNode: ref.read(searchVm.notifier).focusNode,
                  controller: ref.read(searchVm.notifier).controller,
                  onSubmitted: (value) {
                    ref.read(searchVm.notifier).performSearch();
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) => ref.read(searchVm.notifier).filterRecipes(value),
                  onTapFilter: () => ref.read(searchVm.notifier).showFilterBottomSheet(context),
                ),
                16.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Search",
                      style: style.titleSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    if (searchViewModel.totalResults != 0) Text("${searchViewModel.totalResults} results") else const Text(""),
                  ],
                ),
                16.verticalSpace,
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                    itemCount: searchViewModel.filteredRecipes.length,
                    itemBuilder: (context, index) => RecipeCard(
                      title: searchViewModel.filteredRecipes[index],
                      imageUrl: "assets/images/search_page_cook_image.png",
                      rating: "4.0",
                      author: "Chef John",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
