import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return const Color(0xFF00B051).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFF00B051).withOpacity(opacity);
    }
  }

  static Color secondaryColor(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return const Color(0xFFffd71c).withOpacity(opacity);
    } catch (e) {
      return const Color(0xFFffd71c).withOpacity(opacity);
    }
  }

  static Color getRandomColor() {
    return ([...Colors.primaries]..shuffle()).first;
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  static Color colorBlack(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return Colors.black.withOpacity(opacity);
    } catch (e) {
      return Colors.black.withOpacity(opacity);
    }
  }

  static Color colorWhite(double opacity) {
    try {
      // return Color(int.parse(settingRepo.setting.value.mainColor.replaceAll("#", "0xFF"))).withOpacity(opacity);
      return Colors.white.withOpacity(opacity);
    } catch (e) {
      return Colors.white.withOpacity(opacity);
    }
  }

  //other colors
  static Color amber = const Color(0xFFF6B500);
  static Color grey1 = const Color(0xffF6F6F6);
}

// Hex Opacity Values
//
// 100% — FF
// 95% — F2
// 90% — E6
// 85% — D9
// 80% — CC
// 75% — BF
// 70% — B3
// 65% — A6
// 60% — 99
// 55% — 8C
// 50% — 80
// 45% — 73
// 40% — 66
// 35% — 59
// 30% — 4D
// 25% — 40
// 20% — 33
// 15% — 26
// 10% — 1A
// 5% — 0D
// 0% — 00
