import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/feature/profile/view/widgets/profile_textfield_widgets.dart";

class ProfileTextfildWidget extends StatelessWidget {
  ProfileTextfildWidget(
      {required this.controllerE,
      required this.controllerP,
      required this.globalKey,
      required this.controllerN,
      super.key,
      this.onChanged});
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
            Text(
              context.localized.name,
              // style: const AppTextStyle().loginEmail,
            ),
            ProfileTextfieldWidget(
              keyboardType: keyboardTypeName,
              controller: controllerN,
              hintText: context.localized.enterName,
              validator: (value) {
                if (value != null && value.isNotEmpty && value.length >= 2) {
                  return null;
                } else {
                  return context.localized.pleaseEnterName;
                }
              },
              onChanged: onChanged,
            ),
            20.verticalSpace,
            Text(
              context.localized.email,
              // style: const AppTextStyle().loginEmail,
            ),
            5.verticalSpace,
            ProfileTextfieldWidget(
              keyboardType: keyboardTypeEmail,
              controller: controllerE,
              hintText: context.localized.enterName,
              validator: (value) {
                if (value != null &&
                    value.contains("@gmail.com") &&
                    value.length > 10) {
                  return null;
                } else {
                  return context.localized.errorExample;
                }
              },
              onChanged: onChanged,
            ),
            20.verticalSpace,
            Text(
              context.localized.password,
              // style: const AppTextStyle().loginEmail,
            ),
            ProfileTextfieldWidget(
              keyboardType: keyboardTypePassword,
              controller: controllerP,
              hintText: context.localized.enterPassword,
              validator: (value) {
                final regex = RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
                if (value != null && value.contains(regex)) {
                  return null;
                } else {
                  return context.localized.errorPasswordProfile;
                }
              },
              onChanged: onChanged,
            ),
            20.verticalSpace,
          ],
        ),
      );
}
