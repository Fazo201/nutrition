import 'package:flutter/material.dart';

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
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                imageUrl,
                height: 120.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.black54,
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16.0),
                      const SizedBox(width: 4.0),
                      Text(
                        rating,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('By $author', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}