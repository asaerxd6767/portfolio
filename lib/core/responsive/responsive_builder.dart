import 'package:flutter/material.dart';

class Breakpoints {
  Breakpoints._();

  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
  static const double sidebarWidth = 300;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobile;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= mobile && width < tablet;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tablet;

  static bool isWideDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;
}

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    if (Breakpoints.isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }
    if (Breakpoints.isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}
