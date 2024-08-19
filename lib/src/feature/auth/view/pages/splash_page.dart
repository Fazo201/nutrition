import "dart:developer";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/routes/app_route_names.dart";
import "package:nutrition/src/core/storage/app_storage.dart";
import "package:nutrition/src/core/style/app_colors.dart";
import "package:nutrition/src/feature/auth/view_model/splash_vm.dart";
import "package:nutrition/src/feature/settings/locale_controller.dart";

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    ref.read(splashVm(this).notifier);
  }

  @override
  Widget build(BuildContext context) {
    log("\n\n\nSPLASH\n\n");
    final splashWm = ref.watch(splashVm(this));
    return Scaffold(
      backgroundColor: const Color(0xff171A21),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("assets/images/splash_backgraund_image.png").image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Column(
              children: [
                FadeTransition(
                  opacity: splashWm.animation,
                  child: Image.asset(
                    "assets/images/img.png",
                    height: 80,
                    width: 80,
                  ),
                ),
                14.verticalSpace,
                FadeTransition(
                  opacity: splashWm.animation,
                  child: Text(
                    context.localized.premiumRecipe,
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      fontFamily: "Poppins",
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 3),
            PreferredSize(
              preferredSize: const Size(4, 4),
              child: FadeTransition(
                opacity: splashWm.animation,
                child: SlideTransition(
                  position: splashWm.animationIcons,
                  child: Column(
                    children: [
                      Text(
                        context.localized.getCooking,
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 50.sp,
                          fontFamily: "Poppins",
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        context.localized.simpleWayToFindTastyRecipe,
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            FadeTransition(
              opacity: splashWm.animation,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: splashWm.language == LangCodes.uz ? AppColors.c129575 : AppColors.cD9D9D9.withOpacity(0.1),
                        minimumSize: Size(80.w, 36.h),
                      ),
                      onPressed: () {
                        splashWm.changeLanguage(LangCodes.uz);
                      },
                      child: Text(
                        "UZBEK",
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: splashWm.language == LangCodes.ru ? AppColors.c129575 : AppColors.cD9D9D9.withOpacity(0.1),
                        minimumSize: Size(80.w, 36.h),
                      ),
                      onPressed: () {
                        splashWm.changeLanguage(LangCodes.ru);
                      },
                      child: Text(
                        "РУССКИЙ",
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: splashWm.language == LangCodes.en ? AppColors.c129575 : AppColors.cD9D9D9.withOpacity(0.1),
                        minimumSize: Size(80.w, 36.h),
                      ),
                      onPressed: () {
                        splashWm.changeLanguage(LangCodes.en);
                      },
                      child: Text(
                        "ENGLISH",
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: splashWm.language == LangCodes.ja ? AppColors.c129575 : AppColors.cD9D9D9.withOpacity(0.1),
                        minimumSize: Size(80.w, 36.h),
                      ),
                      onPressed: () {
                        splashWm.changeLanguage(LangCodes.ja);
                      },
                      child: Text(
                        "JAPAN",
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            if (splashWm.language != null)
              IconButton.outlined(
                onPressed: () async {
                  String? yesToken = await AppStorage.$read(key: StorageKey.accessToken);
                  yesToken != null ? context.go(AppRouteNames.home) : context.go(AppRouteNames.login);
                },
                highlightColor: AppColors.c129575,
                icon: const Icon(
                  CupertinoIcons.right_chevron,
                  color: AppColors.white,
                ),
              ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
