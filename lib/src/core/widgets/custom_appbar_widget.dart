import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutrition/src/core/style/text_style.dart';

class CustomAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final SvgPicture? actionButton;
  final void Function()? onPressedActionButton;
  const CustomAppbarWidget({
    super.key,
    this.title,
    this.actionButton,
    this.onPressedActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "", style: const AppTextStyle().appBarText),
      centerTitle: true,
      actions: [
        PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'share':
                  break;
                case 'rate':
                  break;
                case 'review':
                  break;
                case 'unsave':
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'share',
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('share'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'rate',
                child: ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Rate Recipe'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'review',
                child: ListTile(
                  leading: Icon(Icons.comment),
                  title: Text('Review'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'unsave',
                child: ListTile(
                  leading: Icon(Icons.bookmark_remove),
                  title: Text('Unsave'),
                ),
              ),
            ],
          ),
        // MaterialButton(
        //   splashColor: Colors.transparent,
        //   highlightColor: Colors.transparent,
        //   padding: EdgeInsets.zero,
        //   onPressed: onPressedActionButton,
        //   child: actionButton,
        // ),
      
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
