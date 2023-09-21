import 'package:budget_buddy/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget customButtonLoadingAnimation({
  required double size,
  Color color = Colors.white,
}) {
  return LoadingAnimationWidget.hexagonDots(
    color: color,
    size: size,
  );
}

Widget customPageLoadingAnimation({
  required double size,
  Color color = Colors.blue,
}) {
  return LoadingAnimationWidget.staggeredDotsWave(
    color: color,
    size: size,
  );
}