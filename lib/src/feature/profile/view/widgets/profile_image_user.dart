import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class ProfileImageUser extends StatelessWidget {
  const ProfileImageUser({super.key});

  @override
  Widget build(BuildContext context) => Center(
      child: CircleAvatar(
          radius: 60.r,
          backgroundImage: AssetImage('assets/images/profile_image.png')),
    );
}
