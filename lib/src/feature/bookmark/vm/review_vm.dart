import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";
import "package:nutrition/src/core/style/app_images.dart";
import "../view/widgets/review_widget.dart";

final reviewVM = ChangeNotifierProvider((ref) => ReviewVm());

class ReviewVm extends ChangeNotifier {
  TextEditingController commentC = TextEditingController();
  List<ReviewWidget> reviewWidgetList = [];

  void addReview(BuildContext context) {

    final now = DateTime.now();
    final formattedDate = DateFormat("MMMM dd, yyyy - HH:mm").format(now);

    if (commentC.text.isNotEmpty) {
      reviewWidgetList.insert(
        0,
        ReviewWidget(
          profileImage: AppImages.defaultProfileImage,
          comment: commentC.text,
          date: formattedDate,
          name: "Bella",
          reviewIndex: reviewWidgetList.length,
          isLike: false,
          isDislike: false,
        ),
      );
      commentC.clear();
      notifyListeners();
    }

  }

  /// Muammo
  void hasLikePressed(int index) {
    reviewWidgetList[index].isLike = true;
    if(reviewWidgetList[index].selected == "like"){

    }
    reviewWidgetList[index].likeCount++;
    reviewWidgetList[index].isDislike = false;
    reviewWidgetList[index].disLikeCount = 0;
    notifyListeners();
  }

  void hasDislikePressed(int index) {
    reviewWidgetList[index].isDislike = true;
    if(reviewWidgetList[index].selected == "like"){

    }
    reviewWidgetList[index].disLikeCount++;
    reviewWidgetList[index].isLike = false;
    reviewWidgetList[index].likeCount = 0;
    notifyListeners();
  }

  @override
  void dispose() {
    commentC.dispose();
    super.dispose();
  }
}
