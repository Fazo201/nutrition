import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:nutrition/src/feature/profile/view/widgets/profile_textfield_widgets.dart';

class ProfileTextfildWidget extends StatelessWidget {
  ProfileTextfildWidget({super.key, required this.controllerE, required this.controllerP});
 final TextEditingController controllerE;
 final TextEditingController controllerP;
  final TextInputType keyboardTypeEmail = TextInputType.emailAddress;
  final TextInputType keyboardTypePassword = TextInputType.visiblePassword;

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
          ProfileTextfieldWidget(
             keyboardType: keyboardTypeEmail,

            controller: controllerE,
            hintText: 'Enter Email',
          ),
          30.verticalSpace,
          const Text(
            'Password',
            // style: const AppTextStyle().loginEmail,
          ),
          ProfileTextfieldWidget(
             keyboardType: keyboardTypePassword,
             controller: controllerP,
            hintText: 'Enter Password',
          ),
          20.verticalSpace,
        ],
      ),
    );
}
