import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";
import "package:nutrition/src/data/model/action_model.dart";
import "../../../data/model/review_widget.dart";

final reviewVM = ChangeNotifierProvider((ref) => ReviewVm());

class ReviewVm extends ChangeNotifier {
  String userId = "id:27";
  TextEditingController commentC = TextEditingController();
  List<Review> reviews = [];

  Future<void> addReview() async {
    final now = DateTime.now();
    final formattedDate = DateFormat("MMMM dd, yyyy - HH:mm").format(now);

    if (commentC.text.isNotEmpty) {
      final newReview = Review(
        name: "Bella",
        date: formattedDate,
        comment: commentC.text,
        profileImage: "https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg",
        actions: [],
      );

      reviews.insert(0, newReview);
      commentC.clear();
      notifyListeners();
    }
  }

  void hasLikePressed(int index) {
    final action = _action(index);
    final res = _isRemoved(index);
    if (action == false || res == false) {
      final action = ActionModel(action: true, id: userId);
      reviews[index].actions.add(action);
      notifyListeners();
    }
  }

  void hasDislikePressed(int index) {
    final action = _action(index);
    final res = _isRemoved(index);
    if (res == false || action == true) {
      final action = ActionModel(action: false, id: userId);
      reviews[index].actions.add(action);
      notifyListeners();
    }
  }

  bool? isLiked(int index) {
    try {
      return reviews[index].actions
          .where((action) => action.id == userId)
          .first
          .action;
    } catch (e) {
      return null;
    }
  }

  int likeCount(int index) {
    return reviews[index]
        .actions
        .where((action) => action.action == true)
        .length;
  }

  int dislikeCount(int index) {
    return reviews[index]
        .actions
        .where((action) => action.action == false)
        .length;
  }

  bool _isRemoved(int index) {
    final before = reviews[index].actions.length;
    reviews[index].actions.removeWhere((action) => action.id == userId);
    final after = reviews[index].actions.length;
    return before != after;
  }

  bool? _action(int index) {
    try {
      return reviews[index]
          .actions
          .firstWhere((a) => a.id == userId)
          .action;
    } catch (e) {
      return null;
    }
  }

  @override
  void dispose() {
    commentC.dispose();
    super.dispose();
  }
}