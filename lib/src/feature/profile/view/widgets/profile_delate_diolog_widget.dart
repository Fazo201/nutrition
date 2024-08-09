import 'package:flutter/material.dart';
import "package:nutrition/src/feature/profile/view/widgets/profile_diolog_widget.dart";
import "package:zoom_tap_animation/zoom_tap_animation.dart";

class DeleteDialog extends BuildShowDialog {
  final String imageUrl;
  final Function() delete;

  DeleteDialog({
    required super.context,
    required this.imageUrl,
    required this.delete
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(imageUrl),
              ),
              const SizedBox(width: 15),
              const Expanded(
                child: Text("Profile rasmini o'chirish",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Text("Profile rasmi o'chirilsinmi?"),
          const SizedBox(height: 15),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                      "Bekor qilish",
                      style: TextStyle(
                          color: Color(0xff5793C3),
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.pop(context);
                    delete();
                  },
                  child: const Text(
                      "Rasmni o'chirish",
                      style: TextStyle(
                          color: Color(0xffCE4342),
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ]
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
