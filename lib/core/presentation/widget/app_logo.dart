
import 'package:flutter/material.dart';
import '../resources/ui_assets.dart';

class AppLogo extends StatelessWidget {
  final double aspectRatio;
  const AppLogo({
    Key? key,
    this.aspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.asset(
        'UIAssets.appLogo',
      ),
    ));
  }
}
class AppLogoRounded extends StatelessWidget {
  final double aspectRatio;
  const AppLogoRounded({
    Key? key,
    this.aspectRatio = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.asset(UIAssets.getImage('app_logo_rounded.png')),
    ));
  }
}
