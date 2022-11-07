import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moru_weather/core/presentation/widget/buttons.dart';

/// custom animated logout dialog
Future showAnimatedDialog(
    {required BuildContext context,
    required Widget widget,
    bool barrierDismissible = true}) {
  return showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return widget;
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }
      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}


void showLoadingDialog(BuildContext context, {Widget? loadingWidget}) {
  showDialog(
    context: context,
    builder: (BuildContext context) =>
        loadingWidget ?? const CustomCupertinoIndicator(),
  );
}

void hideLoadingDialog(BuildContext context) {
  context.router.pop();
}
