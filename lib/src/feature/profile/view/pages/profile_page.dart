
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/profile/view/widgets/profile_image_post_widget.dart";
import "package:nutrition/src/feature/profile/view/widgets/profile_image_user.dart";
import "package:nutrition/src/feature/profile/view/widgets/profile_save_button.dart";
import "package:nutrition/src/feature/profile/view/widgets/profile_user_name_widget.dart";
import "package:nutrition/src/feature/profile/view/widgets/user_info_widget.dart";

import "../../view_model/profile_vm.dart";
import "../widgets/profile_custom_textfild_widget.dart";

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final ctr = ref.read(profileVM);
    // ref.watch(profileVM).read();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          context.localized.profile,
          style: context.theme.textTheme.labelLarge?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10),
            child: ProfileImagePostWidget(
              imagesPosts: () => ctr.pickAndUploadImage(context),
              imagesDelete: () => ctr.deleteProfilerImage(context),
              languageChanges: () => ctr.languageChange(context),
              logOut: () => ctr.logOutAccount(context),
            ),
          ),
        ],
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: SingleChildScrollView(
        padding: REdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Consumer(
              builder: (context, ref, child) => ProfileImageUser(
                profileImagePath: ref.watch(profileVM).profileImagePath,
              ),
            ),
            15.verticalSpace,
            UserNameWidget(
              userName: ref.watch(profileVM).username,
            ),
            25.verticalSpace,
            UserInfoWidget(
              userEmail: ref.watch(profileVM).email,
              userPassword: ref.watch(profileVM).password,
            ),
            15.verticalSpace,
            ProfileTextfildWidget(
              controllerE: ctr.controllerE,
              controllerP: ctr.controllerP,
              controllerN: ctr.controllerN,
              globalKey: ctr.globalKey,
            ),
            15.verticalSpace,
            ProfileButtonWidget(
              onPressed: () {
                if (ctr.globalKey.currentState?.validate() ?? false) {
                  ctr.updateProfile();
                  // log("message");
                } else {
                  // Optionally, show a message or do something when validation fails
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
