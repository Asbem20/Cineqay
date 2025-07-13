import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cineqay/Disenos/app_colors.dart';

class Disponibilidad extends StatelessWidget {
  final bool estado;
  final TextStyle? estiloEstado;

  const Disponibilidad({
    super.key,
    required this.estado,
    this.estiloEstado,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 24.h,
      margin: EdgeInsets.only(left: 30.w),
      decoration: BoxDecoration(
        color: estado ? Appcolors.primary : Appcolors.primary,
      ),
      child: Center(
        child: Text(
          estado ? 'DISPONIBLE' : 'NO DISPONIBLE',
          textAlign: TextAlign.center,
          style: estiloEstado ??
              TextStyle(
                fontSize: 10.sp,
                color: Appcolors.secondary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
