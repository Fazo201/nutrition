
import "package:flutter/material.dart";

import "action_model.dart";

@immutable
class Review {
  final String name;
  final String date;
  final String comment;
  final String? profileImage;
  final List<ActionModel> actions;

  const Review({
    required this.name,
    required this.date,
    required this.comment,
    required this.actions,
    this.profileImage,
  });

  @override
  bool operator ==(Object other) =>
      other is Review &&
          other.name == name &&
          other.date == date &&
          other.comment == comment &&
          other.actions == actions &&
          other.profileImage == profileImage;

  @override
  int get hashCode => Object.hash(
    name,
    date,
    comment,
    actions,
    profileImage,
  );
}
