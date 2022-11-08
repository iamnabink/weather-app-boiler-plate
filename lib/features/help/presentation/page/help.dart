import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moru_weather/core/presentation/resources/constants.dart';
import 'package:moru_weather/core/presentation/resources/ui_assets.dart';
import 'package:moru_weather/features/help/presentation/widgets/app_bar.dart';
import '../../../../core/presentation/widget/custom_system_overlays.dart';
import '../../../../core/presentation/widget/timer.dart';
import '../../di/di.dart';
import '../widgets/bottom_nav.dart';

class HelpPage extends ConsumerStatefulWidget {
  final bool isInitial;

  const HelpPage({
    this.isInitial = true,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<HelpPage> {
  Timer? timer;

  @override
  void initState() {
    ///  Task - If user does not click any button it should redirect automatically to homepage after 5 seconds.
    if (widget.isInitial) {
      timer = Timer(const Duration(seconds: 5), () async {
        ref.read(startupProvider).goToHomePage();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DarkThemeAnnotatedRegion(
      child: Scaffold(
        appBar: AppBarHelp(widget.isInitial),
        bottomNavigationBar: BottomNavHelpPage(() {
          timer?.cancel();
          ref.read(startupProvider).skipHelpPage(); /// Task - If skip button was clicked app should go to homepage directly on later launch.
        }, widget.isInitial),
        body: SafeArea(
          child: Column(
            children: [
              if (widget.isInitial)
                Container(
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    alignment: Alignment.topRight,
                    child: const CustomTimer(
                      text: '$kHelpPageAutoRedirectMsg',
                    )),
              /// Task -  Must have any background image frame
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    UIAssets.getImage('frame.jpeg'),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
