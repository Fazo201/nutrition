import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/app_colors.dart';

class HomePageBottomCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double time;
  final String owner;
  final String profilImgUrl;
  const HomePageBottomCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.owner,
    required this.profilImgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(1, 0.7),
      children: [
        SizedBox(
          height: 95,
          width: 251,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.1), // Semi-transparent black
                  // spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
                BoxShadow(
                  color: const Color(0xFF000000).withOpacity(0.1), // Semi-transparent black
                  // spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.c484848,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 11,
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: Image.asset(profilImgUrl).image,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  owner,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.cA9A9A9,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  size: 17,
                                  color: AppColors.cA9A9A9,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '$time mins',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.cA9A9A9,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 10,
          child: SizedBox(
            height: 86,
            width: 86,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
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