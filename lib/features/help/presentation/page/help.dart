import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moru_weather/core/presentation/resources/colors.dart';
import 'package:moru_weather/core/presentation/resources/constants.dart';
import 'package:moru_weather/core/presentation/resources/ui_assets.dart';
import 'package:moru_weather/core/presentation/widget/buttons.dart';
import '../../../../core/presentation/widget/custom_system_overlays.dart';
import '../../../../core/presentation/widget/timer.dart';
import '../../di/di.dart';
import '../widgets/bottom_nav.dart';

/// splash scree
/// Help Screen:
/// Heading textview: “We show weather for you”
/// Must include button named ‘Skip’
/// Must have any background image frame (Eg: https://www.vhv.rs/dpng/d/427- 4270068_gold-retro-decorative-frame-png-free-download-transparent.png ) your content must not collide with frame border.
/// If skip button was clicked app should go to homepage directly on later launch.
/// If user does not click any button it should redirect automatically to homepage after 5 seconds.

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
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: AppColors.colorWhite(1),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Task: 2
              Text(
                '$kHelpPageWelcomeMsg',
                style: Theme.of(context).textTheme.headline6,
              ),
              const Icon(Icons.cloud_circle)
            ],
          ),
          centerTitle: true,
          leading: (widget.isInitial == false)
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
        ),
        bottomNavigationBar: BottomNavHelpPage(() {
          timer?.cancel();
          ref.read(startupProvider).skipHelpPage();

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
              //Task: 1
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
