import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import 'package:nutrition/src/core/style/app_colors.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String rating;
  final String author;

  const RecipeCard({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.author,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            onPressed: () {
              context.push(AppRouteNames.foodDetailsPage);
            },
            padding: EdgeInsets.zero,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              elevation: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0.r),
                child: Stack(
                  children: [
                    Image.asset(
                      imageUrl,
                      height: 200.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: REdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.cFFE1B3,
                          borderRadius: BorderRadius.circular(12.0.r),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 16),
                            4.horizontalSpace,
                            Text(
                              rating,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      top: 2,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black.withOpacity(0.86), Colors.black12.withOpacity(0)])),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                              shadows: const [
                                Shadow(
                                  blurRadius: 2,
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "By $author",
                            style: const TextStyle(
                              color: AppColors.cA9A9A9,
                              fontSize: 8,
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
