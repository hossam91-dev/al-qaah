import 'dart:math' as math;
import 'package:flutter/material.dart';

class ResponsiveUtils {
  ResponsiveUtils._();

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1200;

  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
  static double wp(BuildContext context, double percent) =>
      screenWidth(context) * (percent / 100);
  static double hp(BuildContext context, double percent) =>
      screenHeight(context) * (percent / 100);
  static double sp(BuildContext context, double percent) =>
      math.min(wp(context, percent), hp(context, percent));

  static bool isMobile(BuildContext context) =>
      screenWidth(context) < mobileBreakpoint;
  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= mobileBreakpoint &&
      screenWidth(context) < tabletBreakpoint;
  static bool isDesktop(BuildContext context) =>
      screenWidth(context) >= tabletBreakpoint;

  static double safeHorizontalPadding(BuildContext context) =>
      wp(context, 5).clamp(16.0, 48.0);
  static double safeVerticalPadding(BuildContext context) =>
      hp(context, 2).clamp(8.0, 32.0);

  static double safeFontSize(BuildContext context, double baseSize) {
    final scale = MediaQuery.textScalerOf(context).scale(baseSize);
    return math.min(scale, baseSize * 1.3);
  }
}

extension ResponsiveContext on BuildContext {
  double get sw => ResponsiveUtils.screenWidth(this);
  double get sh => ResponsiveUtils.screenHeight(this);
  double wp(double percent) => ResponsiveUtils.wp(this, percent);
  double hp(double percent) => ResponsiveUtils.hp(this, percent);
  double sp(double percent) => ResponsiveUtils.sp(this, percent);
  bool get isMobile => ResponsiveUtils.isMobile(this);
  bool get isTablet => ResponsiveUtils.isTablet(this);
  bool get isDesktop => ResponsiveUtils.isDesktop(this);
  double get safeHPadding => ResponsiveUtils.safeHorizontalPadding(this);
  double get safeVPadding => ResponsiveUtils.safeVerticalPadding(this);
}
