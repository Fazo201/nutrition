import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:nutrition/src/core/constants/context_extension.dart";
import 'package:nutrition/src/core/style/app_colors.dart';
import 'package:nutrition/src/core/style/text_style.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_bio_widget.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_info_user.dart';
import 'package:nutrition/src/feature/profile/view/widgets/profile_save_button.dart';
import 'package:nutrition/src/feature/profile/view/widgets/user_email_password.dart';

import '../widgets/profile_textfild_widget.dart';


// TabBarProvider - Riverpod uchun state provider
final tabBarProvider = StateNotifierProvider<TabBarProvider, int>((ref) {
  return TabBarProvider();
});

// TabBarProvider - Riverpod uchun state notifier
class TabBarProvider extends StateNotifier<int> {
  TabBarProvider() : super(0);

  void selectTab(int index) {
    state = index;
  }
}

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
            child: PopupMenuButton(
              color: Colors.white,
              itemBuilder: (context) => [
                PopupMenuItem(
                  // onTap: () => controller.pickAndUploadImage(context),
                  child: Text("Rasmni o'zgartirish"),
                ),
                // if(controller.profileModel!.profileImageUrl != null)
                //   PopupMenuItem(
                //     onTap: () => controller.deleteProfilerImage(context),
                //     child: const Text("Rasmni o'chirish"),
                //   ),


              ],
            )
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
            const ProfileInfoUser(),
            const SizedBox(
              height: 15,
            ),
            UserNameWidget(
              userName: "Asliddin Musulmanov",

            ),
            const SizedBox(
              height: 25,
            ),
            UserEmailPassword(email: "azimjon@com", password: "1233****"),
            SizedBox(height: 5,),
            ProfileTextfildWidget(),
            SizedBox(height: 15,),
            ProfileButtonWidget(text: 'Save',),
          ],
        ),
      ),
    );
  }
}
