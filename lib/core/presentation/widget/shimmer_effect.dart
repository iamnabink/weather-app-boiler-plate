import 'package:flutter/material.dart';

import '../resources/ui_assets.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width, height, radius;

  const ShimmerWidget({this.width, this.height, this.radius, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 4),
        child: Image.asset(
          UIAssets.getImage('loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
