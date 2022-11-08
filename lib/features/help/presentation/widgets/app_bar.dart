import 'package:flutter/material.dart';
import 'package:moru_weather/core/presentation/resources/colors.dart';
import 'package:moru_weather/features/help/presentation/page/help.dart';

import '../../../../core/presentation/resources/constants.dart';

class AppBarHelp extends StatelessWidget implements PreferredSizeWidget {
  final bool isInitial;
  AppBarHelp(this.isInitial);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: AppColors.colorWhite(1),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Task: Heading textview: “We show weather for you”
          Text(
            '$kHelpPageWelcomeMsg',
            style: Theme.of(context).textTheme.headline6,
          ),
          const Icon(Icons.cloud_circle)
        ],
      ),
      centerTitle: true,
      leading: (isInitial==false)
          ? Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.clear,
                  color: AppColors.primaryColor(1),
                )),
          ))
          : null,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
