import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

import "../../../../core/style/app_colors.dart";

class LanguagePickerDialog extends StatelessWidget {
  final List<String> languages = ["English", "Russian", "Uzbek"];
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  LanguagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
      title: Center(child: const Text("Tilni tanlang")),

      content: SizedBox(
        height: 150.h,
        child: ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, value, child) => ListWheelScrollView(
              itemExtent: 50,
              diameterRatio: 1,
              magnification: 1.5,
              useMagnifier: true,
              overAndUnderCenterOpacity: 0.5,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                selectedIndex.value = index;
                log(languages[selectedIndex.value]);
              },
              children: languages.map((language) => Center(child: Text(language, style: const TextStyle(fontSize: 24)))).toList(),
            ),
        ),
      ),
      actions: <Widget>[

        TextButton(
          child:  Text("Bekor qilish",style: context.theme.textTheme.labelSmall?.copyWith(color: AppColors.black),),
          onPressed: () {
            context.pop(); // Diologni yopish
          },
        ),
        TextButton(
          child:  Text("Tanlash",style: context.theme.textTheme.labelSmall?.copyWith(color: AppColors.black),),
          onPressed: () {
           context.pop(languages[selectedIndex.value]); // Tanlangan tilni qaytarish
          },
        ),
      ],
    );

  static Future<String?> show(BuildContext context) => showDialog<String>(
      context: context,
      builder: (BuildContext context) => LanguagePickerDialog(),
    );
}
