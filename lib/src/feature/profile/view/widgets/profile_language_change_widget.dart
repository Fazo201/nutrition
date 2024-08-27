import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";

import "../../../../core/style/app_colors.dart";
import "../../../settings/inherited_locale_notifier.dart";
import "../../../settings/locale_controller.dart";

class LanguagePickerDialog extends StatelessWidget {
  final List<String> languages = ["English", "Russian", "Uzbek", "Japan"];
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  LanguagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Center(child: Text(context.localized.select_a_language)),
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
              children: languages
                  .map((language) => Center(
                      child:
                          Text(language, style: const TextStyle(fontSize: 24)),),)
                  .toList(),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              context.localized.cancel,
              style: context.theme.textTheme.labelSmall
                  ?.copyWith(color: AppColors.black),
            ),
            onPressed: () {
              context.pop();
            },
          ),
          TextButton(
            child: Text(
              context.localized.choose,
              style: context.theme.textTheme.labelSmall
                  ?.copyWith(color: AppColors.black),
            ),
            onPressed: () {
              context.pop(languages[selectedIndex.value]);
              InheritedLocalNotifier.maybeOf(context)
                  ?.changeLocal(selectedIndex.value == 0
                      ? LangCodes.en
                      : selectedIndex.value == 1
                          ? LangCodes.ru
                          : selectedIndex.value == 2
                              ? LangCodes.uz
                              : LangCodes.ja,);
            },
          ),
        ],
      );

  static Future<String?> show(BuildContext context) => showDialog<String>(
        context: context,
        builder: (BuildContext context) => LanguagePickerDialog(),
      );
}
