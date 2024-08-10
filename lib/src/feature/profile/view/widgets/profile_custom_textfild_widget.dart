import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/feature/profile/view/widgets/profile_textfield_widgets.dart";

class ProfileTextfildWidget extends StatelessWidget {
   ProfileTextfildWidget({required this.controllerE, required this.controllerP, required this.globalKey, required this.controllerN, super.key, this.onChanged});
 final TextEditingController controllerE;
 final TextEditingController controllerP;
 final TextEditingController controllerN;
  final TextInputType keyboardTypeEmail = TextInputType.emailAddress;
  final TextInputType keyboardTypePassword = TextInputType.visiblePassword;
  final TextInputType keyboardTypeName = TextInputType.name;
   final void Function(String?)? onChanged;


   final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) => Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          57.verticalSpace,
          const Text(
            "Email",
            // style: const AppTextStyle().loginEmail,
          ),
          5.verticalSpace,
          ProfileTextfieldWidget(
             keyboardType: keyboardTypeEmail,
            controller: controllerE,
            hintText: "Enter Email",
            validator: (value) {
              if (value != null && value.contains("@gmail.com") && value.length > 10) {
                return null;
              } else {
                return "Please enter your email address\nExample => (example@gmail.com)";
              }
            },
            onChanged: onChanged,
          ),
          30.verticalSpace,
          const Text(
            "Password",
            // style: const AppTextStyle().loginEmail,
          ),
          ProfileTextfieldWidget(
             keyboardType: keyboardTypePassword,
             controller: controllerP,
            hintText: "Enter Password",
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return null;
              } else {
                return "Please enter your password";
              }
            },
            onChanged: onChanged,
          ),
          20.verticalSpace,
          const Text(
            "Name",
            // style: const AppTextStyle().loginEmail,
          ),
          ProfileTextfieldWidget(
            keyboardType: keyboardTypeName,
            controller: controllerN,
            hintText: "Enter Name",
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return null;
              } else {
                return "Please enter your name";
              }
            },
            onChanged: onChanged,
          ),
          20.verticalSpace,
        ],
      ),
    );
}
