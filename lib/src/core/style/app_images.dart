import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:nutrition/generated/assets.dart";

final class AppImages{

  const AppImages._();

  // *** svg images

  static final monitoring = SvgPicture.asset(
    Assets.iconsFileIcon,
    height: 24.w,
    width: 24.w,
  );


  // *** png images

  static final sitting = Image.asset(
    Assets.imagesImg,
    height: 216.w,
    width: 216.w,
  );

  static final defaultProfileImage = Image.asset(
    Assets.imagesDefaultProfileImage,
    // width: 31.w,
    // height: 31.h,
    fit: BoxFit.cover,
  );

}