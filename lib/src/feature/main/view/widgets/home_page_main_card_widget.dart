import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/app_colors.dart';

class HomePageMainCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final double rating;

  const HomePageMainCardWidget({
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
        SizedBox(
          width: 150,
          height: 176,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.cD9D9D9,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.c484848,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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
          ),
        ),
        Positioned(
          top: 0,
          child: SizedBox(
            height: 110,
            width: 110,
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
        Positioned(
          top: 30,
          right: 0,
          child: RatingCard(rating: rating),
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.cFFE1B3,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
