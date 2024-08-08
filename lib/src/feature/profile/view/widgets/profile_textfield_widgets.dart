import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import '../../../../core/style/app_colors.dart';

class ProfileTextfieldWidget extends StatelessWidget {
  final String hintText;
  const ProfileTextfieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) => TextFormField(
      cursorColor: Colors.deepPurple,
      cursorHeight: 22.h,
      // controller: loginEmailC,
      // focusNode: emailFocusNode,
      // textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        // hintStyle: const AppTextStyle().loginEnter,
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.cD9D9D9,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.cD9D9D9,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        border:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.cD9D9D9,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
      ),
    );
}
