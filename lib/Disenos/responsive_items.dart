import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ResponsiveUnit { sp, h, w }

class ResponsiveHelper {
  /// Cambiar el tamaño según el alto de la pantalla
  static double sizeDueToHeight(
    BuildContext context, {
    required double small,
    required double normal,
    required ResponsiveUnit unit,
    double breakpoint = 745,
  }) {
    final height = MediaQuery.of(context).size.height;
    switch (unit) {
      case ResponsiveUnit.sp:
        return height < breakpoint ? small.sp : normal.sp;
      case ResponsiveUnit.h:
        return height < breakpoint ? small.h : normal.h;
      case ResponsiveUnit.w:
        return height < breakpoint ? small.w : normal.w;
    }
  }

  /// Cambiar el tamaño según el ancho de la pantalla
  static double sizeDueToWidth(
    BuildContext context, {
    required double small,
    required double normal,
    required ResponsiveUnit unit,
    double breakpoint = 390,
  }) {
    final width = MediaQuery.of(context).size.width;
    switch (unit) {
      case ResponsiveUnit.sp:
        return width < breakpoint ? small.sp : normal.sp;
      case ResponsiveUnit.h:
        return width < breakpoint ? small.h : normal.h;
      case ResponsiveUnit.w:
        return width < breakpoint ? small.w : normal.w;
    }
  }
}
