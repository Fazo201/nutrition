import 'package:flutter/material.dart';
import '../../../../core/style/app_colors.dart';

class ProfileButtonWidget extends StatelessWidget {


  const ProfileButtonWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.c129575,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: const Size(double.maxFinite, 60),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Save",
            // style:  AppTextStyle().splashButton,
          ),
        ],
      ),
    );
  }
}
