import 'package:flutter/material.dart';
import 'package:moru_weather/core/presentation/resources/colors.dart';
import 'package:moru_weather/features/help/presentation/page/help.dart';

import '../../../../core/presentation/resources/constants.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.colorWhite(1),
      elevation: 0.2,
      title: Text(
        '$kAppName',
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        IconButton(
            onPressed: () {
              // since route-guard has been used in auto-route navigation, here we used material navigation
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HelpPage(
                      isInitial: false,
                    )),
              );
            },
            icon: const Icon(Icons.help_outline))
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
