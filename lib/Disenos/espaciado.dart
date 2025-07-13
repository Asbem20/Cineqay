import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Espaciado extends StatelessWidget {
  final double ancho;
  final double alto;
  final double topMargin;
  final double botMargin;

  const Espaciado({
    super.key,
    required this.ancho,
    required this.alto,
    required this.topMargin,
    required this.botMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ancho.w,
      height: alto.h,
      margin: EdgeInsets.fromLTRB(0, topMargin.h, 0, botMargin.h),
      color: const Color.fromRGBO(102, 102, 102, 1),
    );
  }
}
