import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:nutrition/src/core/constants/context_extension.dart";
import 'package:nutrition/src/core/style/app_colors.dart';
import "package:nutrition/src/core/style/app_images.dart";
import 'package:nutrition/src/feature/profile/view/widgets/profile_user_name_widget.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_image_user.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_save_button.dart';
import 'package:nutrition/src/feature/profile/view/widgets/user_info_widget.dart';
import '../widgets/profile_textfild_widget.dart';




class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: context.theme.textTheme.labelLarge,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: AppImages.monitoring
            ,
            // child: IconButton(
            //   onPressed: () {},
            //   icon: SvgPicture.asset("assets/icons/more_apbar_icon.svg"),
            // ),
          ),
        ],
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const ProfileImageUser(),
            const SizedBox(
              height: 15,
            ),
            UserNameWidget(
            ),
            const SizedBox(
              height: 25,
            ),
            UserInfoWidget(email: "azimjon@com", password: "1233****"),
            SizedBox(height: 5,),
            ProfileTextfildWidget(),
            SizedBox(height: 15,),
            ProfileButtonWidget(),
          ],
        ),
      ),
    );
  }
}
