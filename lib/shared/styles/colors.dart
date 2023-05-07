import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  static Color roseBebe = HexColor("#DD3562");
  static Color roseFonce = HexColor("#CB3C82");
  static Color appBarColor = HexColor("#230F4E");
  static Color roseClair = HexColor("#C53E8D");
  static Color mauveClair = HexColor("#8354FF");
  static Color mauveFonce = HexColor("#8A52F3");
  static Color green = HexColor("#11C122");
  static Color grey =HexColor("#CBC6F6");
  static Color bubbleColor = HexColor("#612DA6");
  static Color messageBackgroundColor = HexColor("#612DA6");
  static Gradient backGroundGradient = LinearGradient(
      colors: [HexColor("#140034"), HexColor("#01010D")],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static Gradient fillGradient = LinearGradient(
      colors: [AppColors.roseBebe, AppColors.mauveClair],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
  static BoxBorder borderGradient = GradientBoxBorder(
      gradient: LinearGradient(
          colors: [AppColors.roseClair, AppColors.mauveFonce],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight));
}
