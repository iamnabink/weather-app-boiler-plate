import 'package:flutter/material.dart';

import '../../../../core/presentation/widget/app_version_builder.dart';

class BottomNavHelpPage extends StatelessWidget {
  const BottomNavHelpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 60, child: Center(child: AppVersionBuilder()));
  }
}