import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/text_style.dart';
import 'package:nutrition/src/feature/bookmark/view/widgets/bookmark_page_main_box.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved recipes",),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => const BookmarkPageMainBox(),
      ),
    );
  }
}
