import 'package:flutter/material.dart';

class CustomTimer extends StatelessWidget {
  final Duration? duration;
  final String? text;

  const CustomTimer({this.duration, this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
        duration: duration ?? const Duration(seconds: 5),
        tween: Tween(
            begin: duration ?? const Duration(seconds: 5), end: Duration.zero),
        onEnd: () {},
        builder: (BuildContext context, Duration value, Widget? child) {
          // final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                '$text $seconds',
                textAlign: TextAlign.center,
              ));
        });
  }
}
