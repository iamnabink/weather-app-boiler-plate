import 'package:flutter/material.dart';

/// splash scree
/// Help Screen:
/// Heading textview: “We show weather for you”
/// Must include button named ‘Skip’
/// Must have any background image frame (Eg: https://www.vhv.rs/dpng/d/427- 4270068_gold-retro-decorative-frame-png-free-download-transparent.png ) your content must not collide with frame border.
/// If skip button was clicked app should go to homepage directly on later launch.
/// If user does not click any button it should redirect automatically to homepage after 5 seconds.


//TODO: - Add splash screen


class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
