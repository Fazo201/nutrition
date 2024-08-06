import 'package:flutter/material.dart';

class SearchRecipesPage extends StatelessWidget {
  const SearchRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// no style yet
        title: const Text("Search recipes",),
        centerTitle: true,
      ),
    );
  }
}
