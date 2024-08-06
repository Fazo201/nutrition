import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:sizer/sizer.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Jega',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'What are you cooking today?',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.cFFCE80,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40.h,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search recipe',
                            hintStyle: TextStyle(color: AppColors.cD9D9D9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: AppColors.cD9D9D9),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: AppColors.cD9D9D9),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.c129575,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 15.h),

            // custom tabbar
            SizedBox(
              height: 51,
              width: double.infinity,
              child: ListView.builder(
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
            SizedBox(
              height: 231,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  return const RecipeCard(
                    imageUrl: 'https://www.pngall.com/wp-content/uploads/2016/03/Food-PNG.png',
                    title: 'Classic Greek Salad',
                    time: '15 Mins',
                    rating: 4.5,
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

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final double rating;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 150,
          height: 176,
          decoration: BoxDecoration(
            color: AppColors.cD9D9D9,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.c484848,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Time',
                        style: TextStyle(
                          color: AppColors.cA9A9A9,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        time,
                        style: const TextStyle(
                          color: AppColors.c484848,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Positioned(
          top: 10,
          child: SizedBox(
            height: 110,
            width: 110,
            child: DecoratedBox(
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RatingCard extends StatelessWidget {
  final double rating;
  const RatingCard({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 23,
      child: DecoratedBox(
        decoration: const BoxDecoration(shape: BoxShape.rectangle),
        child: Row(
          children: [
            const Icon(
              Icons.star_outlined,
              color: AppColors.cFF9C00,
              size: 10,
            ),
            Text(
              '$rating',
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
