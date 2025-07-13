import 'package:cineqay/Disenos/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitulosCatalogo extends StatelessWidget {
  // Propiedades
  final int anchoTexto;
  final int altoTexto;
  final String textoComplemento;
  final String genero;

  const TitulosCatalogo({
    super.key,
    this.anchoTexto = 340,
    this.altoTexto = 30,
    required this.textoComplemento,
    required this.genero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: anchoTexto.w,
      height: altoTexto.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.h, color: Appcolors.textPrimary),
        ),
      ),
      child: Text.rich(
        TextSpan(
          text: textoComplemento,
          style: TextStyle(
            color: Appcolors.textPrimary,
            fontSize: 15.sp,
            fontFamily: 'Cocogoose',
          ),
          children: [
            TextSpan(
              text: genero,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Appcolors.textPrimary,
                fontFamily: 'Cocogoose',
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
