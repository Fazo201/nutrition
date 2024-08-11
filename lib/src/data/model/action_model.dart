class ActionModel {
  String? id;
  bool? action; // true= liked, false = disliked
  ActionModel({
    required this.action,
    required this.id,
  });
}