import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Screens/datolibro.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/listas.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Widget para el diseño de la cartilla de recomendaciones
class CartaRecomendacion extends StatelessWidget {
  final String idusuario; // ID del usuario actual
  const CartaRecomendacion({super.key, required this.idusuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.h, left: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado de la sección
          Text(
            'Recomendaciones',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Appcolors.textPrimary,
            ),
          ),
          SizedBox(height: 10),

          //Lista de recomendaciones
          SizedBox(
            height: 230,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    peliculas.take(8).map((pelicula) {
                      return GestureDetector( // Detecta taps sobre la tarjeta
                        onTap: () {
                          // Navega a la página de la película
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => Datolibro(
                                    idpelicula: pelicula['idpelicula'],
                                    idusuario: idusuario,
                                  ),
                            ),
                          );
                        },
                        child: Container(
                          width: 140,
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                // Imagen
                                child: Image.network(
                                  pelicula['img_url'],
                                  height: 180,
                                  width: 140,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) => Container(
                                        height: 180.h,
                                        width: 140.w,
                                        color: Colors.grey[300],
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 40,
                                        ),
                                      ),
                                ),
                              ),
                              SizedBox(height: 5),
                              // Título
                              Text(
                                pelicula['Titulo'],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Appcolors.secondary,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
