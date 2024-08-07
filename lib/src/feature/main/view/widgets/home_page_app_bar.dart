import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/feature/search/view/pages/search_recipes_page.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Jega',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'What are you cooking today?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.cFFCE80,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchRecipesPage()));
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search recipe',
                      hintStyle: const TextStyle(color: AppColors.cD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: AppColors.cD9D9D9),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: AppColors.cD9D9D9),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                height: 40,
                width: 40,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.c129575,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchRecipesPage()));
                    },
                    child: SvgPicture.asset('assets/icons/filter_icon.svg'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
