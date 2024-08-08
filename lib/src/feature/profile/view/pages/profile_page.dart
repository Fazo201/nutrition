import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import 'package:nutrition/src/core/style/app_colors.dart';
import "package:nutrition/src/feature/profile/view/widgets/profile_image_post_widget.dart";
import 'package:nutrition/src/feature/profile/view/widgets/profile_user_name_widget.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_image_user.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_save_button.dart';
import 'package:nutrition/src/feature/profile/view/widgets/user_info_widget.dart';
import '../widgets/profile_textfild_widget.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Profile",
            style: context.theme.textTheme.labelLarge?.copyWith(color: AppColors.black,fontWeight: FontWeight.w600,fontSize: 16.sp),
          ),
          centerTitle: true,
          actions:   [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 10),
              child: ProfileImagePostWidget(),
            ),
          ],
          backgroundColor: AppColors.white,
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              const ProfileImageUser(),
              15.verticalSpace,
              const UserNameWidget(),
              25.verticalSpace,
              const UserInfoWidget(email: "azimjon@com", password: "1233****"),
              5.verticalSpace,
              ProfileTextfildWidget(),
              15.verticalSpace,
              const ProfileButtonWidget(),
            ],
          ),
        ),
      );
}
