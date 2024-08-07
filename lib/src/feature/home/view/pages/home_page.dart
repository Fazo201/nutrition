import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/feature/home/view/widgets/home_page_app_bar.dart';
import 'package:nutrition/src/feature/home/view/widgets/home_page_bottom_card_widget.dart';
import 'package:nutrition/src/feature/home/view/widgets/home_page_main_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curretIndex = 0;
  var tabBarItems = ['All', 'Indian', 'Italian', 'Asian', 'Chinese', 'Uzbekistan', 'USA', 'Turkey'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: HomePageAppBar(),
      ),
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // custom tabbar
          SizedBox(
            height: 51,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30),
              scrollDirection: Axis.horizontal,
              itemCount: tabBarItems.length,
              itemBuilder: (ctx, i) {
                return MaterialButton(
                  height: 31,
                  minWidth: 54,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  color: curretIndex == i ? AppColors.c129575 : AppColors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onPressed: () async {
                    curretIndex = i;
                    setState(() {});
                  },
                  child: Text(
                    tabBarItems[i],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: curretIndex == i ? AppColors.white : AppColors.c71B1A1,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),

          // home page main cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SizedBox(
              height: 231,
              width: double.infinity,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  return const HomePageMainCardWidget(
                    imageUrl: 'https://www.freepnglogos.com/uploads/food-png/food-sutherland-foodservice-12.png',
                    title: 'Classic Greek Salad',
                    time: '15 Mins',
                    rating: 4.5,
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // home page text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'New Recipes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 5),
          // home page bottom card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: SizedBox(
              height: 127,
              width: double.infinity,
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 28),
                itemBuilder: (_, i) {
                  return const HomePageBottomCardWidget(
                    imageUrl: 'https://www.freepnglogos.com/uploads/food-png/food-sutherland-foodservice-12.png',
                    title: 'Steak with tomato...',
                    time: 20,
                    owner: 'By James Milner',
                    profilImgUrl: 'assets/images/mini_profile_image.png',
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}