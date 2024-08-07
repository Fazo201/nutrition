import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/app_colors.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String rating;
  final String author;

  const RecipeCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Stack(
            children: [
              Image.asset(
                imageUrl,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: AppColors.cFFE1B3,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16.0),
                      const SizedBox(width: 4.0),
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
                right: 1,
                left: 1,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.86),
                        Colors.black12.withOpacity(0.0)
                      ]
                    )
                  ),
                ),
              ),
              Positioned(
                bottom: 8.0,
                left: 8.0,
                right: 8.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'By $author',
                      style: const TextStyle(
                        color: AppColors.cA9A9A9,
                        fontSize: 10,
                        shadows: [
                          Shadow(
                            blurRadius: 2.0,
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
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
    );
  }
}
