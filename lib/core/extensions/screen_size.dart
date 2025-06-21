import 'package:dolar_hoy/core/constants/breakpoints.dart';
import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  bool get isMobile => screenSize.width < Breakpoints.mobile;

  bool get isTablet => screenSize.width >= Breakpoints.mobile;

  bool get isDesktop => screenSize.width >= Breakpoints.tablet;

  bool get isLargeScreen => screenSize.width >= Breakpoints.desktop;
}
