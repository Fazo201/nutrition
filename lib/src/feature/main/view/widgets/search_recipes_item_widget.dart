import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/style/app_colors.dart";

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
              context.go("${AppRouteNames.home}/${AppRouteNames.search}/${AppRouteNames.foodDetails}");
            },
            padding: EdgeInsets.zero,
            child: Card(
              shadowColor: Colors.transparent,
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
                        // height: ,
                        padding: REdgeInsets.only(top: 4, bottom: 4, left: 7, right: 7),
                        decoration: BoxDecoration(
                          color: AppColors.cFFE1B3,
                          borderRadius: BorderRadius.circular(12.0.r),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 10),
                            4.horizontalSpace,
                            Text(
                              rating,
                              style: TextStyle(color: Colors.black, fontSize: 10.sp, fontWeight: FontWeight.w400),
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
                            colors: [Colors.black.withOpacity(0.86), Colors.black12.withOpacity(0)],
                          ),
                        ),
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
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "By $author",
                            style: TextStyle(
                              color: AppColors.cA9A9A9,
                              fontSize: 8.sp,
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
