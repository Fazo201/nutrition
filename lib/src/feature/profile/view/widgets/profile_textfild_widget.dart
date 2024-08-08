import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:nutrition/src/feature/profile/view/widgets/profile_textfield_widgets.dart';

class ProfileTextfildWidget extends StatelessWidget {
  ProfileTextfildWidget({super.key});

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          57.verticalSpace,
          const Text(
            'Email',
            // style: const AppTextStyle().loginEmail,
          ),
          5.verticalSpace,
          const ProfileTextfieldWidget(
            hintText: 'Enter Email',
          ),
          30.verticalSpace,
          const Text(
            'Password',
            // style: const AppTextStyle().loginEmail,
          ),
          const ProfileTextfieldWidget(
            hintText: 'Enter Password',
          ),
          20.verticalSpace,
        ],
      ),
    );
}
