import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
        bottomNavigationBar: const BottomNavHelpPage(),
        body: SafeArea(
          child: Stack(
            children: [
              //Task: 1
              Image.asset(
                UIAssets.getImage('frame.jpeg'),
                height: double.infinity,
                width: double.infinity,
              ),
              if (widget.isInitial)
                Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    alignment: Alignment.topRight,
                    child: const CustomTimer(
                      text: 'Auto-redirecting in..',
                    )),
              Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Task: 2
                      Text(
                        'We show weather for you',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const Icon(Icons.cloud_circle)
                    ],
                  )),
              //Task: 3
              if (widget.isInitial)
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, top: 15),
                      child: PrimaryOutlinedButton(
                        height: 40,
                        width: 50,
                        title: 'SKIP',
                        onPressed: () {
                          timer?.cancel();
                          ref.read(startupProvider).skipHelpPage();
                        },
                      ),
                    )),
              if (widget.isInitial==false)  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.clear)),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
