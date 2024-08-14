import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/feature/profile/view/widgets/profile_diolog_widget.dart";

import "../../../../core/style/text_style.dart";

class DeleteDialog extends BuildShowDialog {
  final String imageUrl;
  final Function() delete;

  DeleteDialog(
      {required super.context, required this.imageUrl, required this.delete,});

  @override
  Widget build(BuildContext context) => AlertDialog(
      contentPadding:  REdgeInsets.symmetric(horizontal: 20, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          15.verticalSpace,
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Profile rasmini o'chirish",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontSize.size16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          10.verticalSpace,
          const Text("         Profile rasmi o'chirilsinmi?"),
         15.verticalSpace,
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, children:
          [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Bekor qilish",
                  style: TextStyle(
                      color: Color(0xff5793C3), fontWeight: FontWeight.bold,),),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                delete();
              },
              child: const Text("Rasmni o'chirish",
                  style: TextStyle(
                      color: Color(0xffCE4342), fontWeight: FontWeight.bold,),),
            ),
          ]),
          const SizedBox(height: 15),
        ],
      ),
    );
}
