import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:intl/intl.dart";
import "package:nutrition/src/core/constants/context_extension.dart";
import "package:nutrition/src/core/style/app_images.dart";
import "../../../core/style/app_colors.dart";
import "../view/widgets/review_widget.dart";

final reviewVM = ChangeNotifierProvider((ref) => ReviewVm());

class ReviewVm extends ChangeNotifier {
  TextEditingController commentC = TextEditingController();

  int reviewLength = 0;
  List<GestureDetector> reviewWidgetList = [];
  List<SizedBox> likeAndDislikeList = [];
  String comment = "";

  void listReviewLength(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat("MMMM dd, yyyy - HH:mm").format(now);
    if (commentC.text.isNotEmpty) {
      reviewWidgetList.insert(
        0,
        GestureDetector(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text(
                  textAlign: TextAlign.center,
                  "Select",
                  style: context.theme.textTheme.displaySmall,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        height: 70.h,
                        minWidth: 100.w,
                        color: AppColors.cAFD3CA,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: AppColors.cAFD3CA,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "👍",
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 35.sp,
                          ),
                        ),
                      ),
                      MaterialButton(
                        height: 70.h,
                        minWidth: 100.w,
                        color: AppColors.cAFD3CA,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: AppColors.cAFD3CA,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "👎",
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            fontSize: 35.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          child: ReviewWidget(
            profileImage: AppImages.defaultProfileImage,
            comment: commentC.text,
            date: formattedDate,
            disLikeCount: 2,
            likeCount: 3,
            name: "Bella",
          ),
        ),
      );
    }
    commentC.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    commentC.dispose();
  }
}
