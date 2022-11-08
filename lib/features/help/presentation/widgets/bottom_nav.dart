import 'package:flutter/material.dart';

import '../../../../core/presentation/widget/app_version_builder.dart';
import '../../../../core/presentation/widget/buttons.dart';

class BottomNavHelpPage extends StatelessWidget {
  final VoidCallback callback;
  final bool isInitial;
  const BottomNavHelpPage(this.callback,this.isInitial);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 60, child: Stack(
          children: [
            const Center(child: AppVersionBuilder()),
            if (isInitial)
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,bottom: 10),
                    child: PrimaryOutlinedButton(
                      height: 40,
                      width: 50,
                      radius: 25,
                      title: 'SKIP',
                      onPressed: () {

                      },
                    ),
                  )),
          ],
        ));
  }
}