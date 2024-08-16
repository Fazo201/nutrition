import "dart:io";

import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class ProfileImageUser extends StatelessWidget {
  const  ProfileImageUser({super.key,  this.profileImagePath});
 final String? profileImagePath;

  @override
  Widget build(BuildContext context) => Center(
      child: CircleAvatar(
          radius: 60.r,
          backgroundImage:  profileImage(profileImagePath: profileImagePath ),),
    );
}
ImageProvider<Object>? profileImage({String? profileImagePath,}) => profileImagePath != null ? Image.file(File(profileImagePath)).image : const AssetImage("assets/images/profile_image.png");