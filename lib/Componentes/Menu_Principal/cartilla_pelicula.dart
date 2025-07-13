import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/responsive_items.dart';
import 'package:cineqay/Screens/datolibro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartillaPelicula extends StatelessWidget {
  // Declaro variables para la información
  final String urlImagen;
  final String tituloPelicula;
  final String sinopsis;
  final String calificacion;
  final Map<String, dynamic> pelicula;
  final Map<String, dynamic> usuario;

  const CartillaPelicula({
    super.key,
    required this.urlImagen,
    required this.tituloPelicula,
    required this.calificacion,
    required this.sinopsis,
    required this.pelicula,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagen de la pelicula
          Stack(
            children: [
              SizedBox(
                width: 130.w,
                height: 210.h,
                child: Image.network(urlImagen, fit: BoxFit.cover),
              ),

              Container(
                margin: EdgeInsets.only(top: 5.h),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                decoration: BoxDecoration(color: Appcolors.backgroundComponent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 10.w,
                  children: [
                    Icon(Icons.star, color: Appcolors.textPrimary),
                    Text(
                      calificacion,
                      style: TextStyle(color: Appcolors.textPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Contenido general
          Container(
            width: 210.w,
            height: 210.h,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(color: Appcolors.secondary),
            child: Column(
              children: [
                // Titulo
                SizedBox(
                  height: 32.h,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      tituloPelicula,
                      style: TextStyle(
                        fontFamily: 'Cocogoose',
                        color: Appcolors.textPrimary,
                        fontSize: ResponsiveHelper.sizeDueToHeight(
                          context,
                          small: 16,
                          normal: 18,
                          unit: ResponsiveUnit.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                // Sinopsis
                Container(
                  width: 194.w,
                  padding: EdgeInsets.only(top: 8.h),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Appcolors.textPrimary, width: 1.h),
                    ),
                  ),
                  child: Text(
                    sinopsis,
                    textAlign: TextAlign.justify,
                    maxLines: 4,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: ResponsiveHelper.sizeDueToHeight(
                        context,
                        small: 13,
                        normal: 14,
                        unit: ResponsiveUnit.sp,
                      ),
                      color: Appcolors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.sizeDueToHeight(
                    context,
                    small: 10,
                    normal: 18,
                    unit: ResponsiveUnit.h,
                  ),
                ),
                // Recomendado y VER MÁS
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => Datolibro(
                              idpelicula: pelicula['idpelicula'],
                              idusuario: usuario['idusuario'],
                            ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors.textPrimary,
                    foregroundColor: Appcolors.secondary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.h,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size(80.w, 18.h), // Puedes ajustar esto
                    visualDensity:
                        VisualDensity.comfortable, // Opcional: reduce aún más
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('VER MÁS', style: TextStyle(fontSize: 11.sp)),
                      SizedBox(width: 4.w),
                      Icon(Icons.arrow_forward, size: 18.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
