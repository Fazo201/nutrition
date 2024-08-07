import 'package:flutter/material.dart';
import 'package:nutrition/src/core/style/text_style.dart';

import '../../../../core/style/app_colors.dart';

class ProfileBioWidget extends StatelessWidget {
  final String userName;
  final String userLabel;
  final String userBio;

  ProfileBioWidget(
      {super.key,
      required this.userName,
      required this.userLabel,
      required this.userBio});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName,
          style: AppTextStyle().profileTitle,
        ),
        Text(
          userLabel,
          style: AppTextStyle().loginEnter,
        ),
        const SizedBox(
          height: 10,
        ),
        ValueListenableBuilder(
            valueListenable: isExpanded,
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userBio,
                    maxLines: isExpanded.value == false ? 2 : null,
                    style: AppTextStyle().loginEnter,
                  ),
                  // if (isExpanded.value == false)
                    InkWell(
                      onTap: () {
                        isExpanded.value = !isExpanded.value;
                      },
                        child: Text(
                      "More...",
                      style:AppTextStyle().loginEnter?.copyWith(color: AppColors.c129575),
                    ))
                ],
              );
            }),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
