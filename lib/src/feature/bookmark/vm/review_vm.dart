import "dart:developer";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";
import "package:nutrition/src/core/style/app_images.dart";
import "../view/widgets/review_widget.dart";

final reviewVM = ChangeNotifierProvider((ref) => ReviewVm());

class ReviewVm extends ChangeNotifier {
  String userId = "id:27"; //todo
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
          actions: [],
        ),
      );
      commentC.clear();
      notifyListeners();
    }
  }

  void hasLikePressed(int index) {
    final action = _action(index);
    final res = _isRemoved(index);
    if (action == false || res == false) {
      final action = ActionModel(action: true, id: userId);
      reviewWidgetList[index].actions.add(action);
    }
    notifyListeners();
  }

  bool _isRemoved(int index) {
    try {
      final before = reviewWidgetList[index].actions.length;
      reviewWidgetList[index].actions.removeWhere((action) => action.id == userId);
      final after = reviewWidgetList[index].actions.length;
      return before != after;
    } catch (e) {
      return false;
    }
  }

  bool? _action(int index) {
    try {
      final res = reviewWidgetList[index].actions.firstWhere((a) => a.id == userId);
      return res.action;
    } catch (e) {
      return null;
    }
  }

  void hasDislikePressed(int index) {
    final action = _action(index);
    final res = _isRemoved(index);
    if (res == false || action! == true) {
      final action = ActionModel(action: false, id: userId);
      reviewWidgetList[index].actions.add(action);
      log(reviewWidgetList[index].actions.toString());
    }
    notifyListeners();
  }

  bool? isLiked(int index) {
    try {
      final action = reviewWidgetList[index].actions.where((action) => action.id == userId).first.action;
      return action;
    } catch (e) {
      return null;
    }
  }

  int likeCount(int index) {
    final length = reviewWidgetList[index].actions.where((action) => action.action == true).length;
    return length;
  }

  int dislikeCount(int index) {
    final length = reviewWidgetList[index].actions.where((action) => action.action == false).length;
    return length;
  }

  @override
  void dispose() {
    commentC.dispose();
    super.dispose();
  }
}
