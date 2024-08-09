import 'package:flutter/material.dart';

abstract class BuildShowDialog {
  final BuildContext context;
  bool barrierDismissible = true;
  Color? barrierColor;
  String? barrierLabel;
  bool useSafeArea = true;
  bool useRootNavigator = true;
  RouteSettings? routeSettings;
  Offset? anchorPoint;
  TraversalEdgeBehavior? traversalEdgeBehavior;

  BuildShowDialog({required this.context}){
    style();
    showDialog(
      context: context,
      builder: (context) => build(context),
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
    );
  }

  void style(){}
  Widget build(BuildContext context);
}