import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ref - https://stackoverflow.com/a/66942220/12030116
/// /// update color for status bar icon to Light [Brightness.light]
class LightThemeAnnotatedRegion extends StatelessWidget {
  final Widget child;
  const LightThemeAnnotatedRegion({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:SystemUiOverlayStyle.light,
      child: child,
    );
  }
}

/// ref - https://stackoverflow.com/a/66942220/12030116
/// update color for status bar icon to Dark [Brightness.dark]
class DarkThemeAnnotatedRegion extends StatelessWidget {
  final Widget child;
  const DarkThemeAnnotatedRegion({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:SystemUiOverlayStyle.dark,
      child: child,
    );
  }
}
