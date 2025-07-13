import 'package:cineqay/Componentes/Menu_Principal/barra.dart';
import 'package:cineqay/Componentes/Pagina_Libro/calificacion.dart';
import 'package:cineqay/Componentes/Pagina_Libro/carta_recome.dart';
import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Disenos/espaciado.dart';
import 'package:cineqay/Disenos/fondo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cineqay/listas.dart';

class Datolibro extends StatefulWidget {
  final int idpelicula;
  final String idusuario;

  const Datolibro({
    super.key,
    required this.idpelicula,
    required this.idusuario,
  });

  @override
  State<Datolibro> createState() => _DatolibroState();
}

class _DatolibroState extends State<Datolibro> {
  Map<String, dynamic>? _pelicula;

  @override
  void initState() {
    super.initState();

    // Buscar película en la lista
    _pelicula = peliculas.firstWhere(
      (peli) => peli['idpelicula'] == widget.idpelicula,
      orElse: () => {},
    );
  }

  @override
  Widget build(BuildContext context) {
    bool esFavorito =
        _pelicula?['favoritos']?.contains(widget.idusuario) ?? false;
    bool esDeseado =
        _pelicula?['deseados']?.contains(widget.idusuario) ?? false;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarra(),
      body: FondoDegradado(
        child:
            _pelicula == null || _pelicula!.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 260.h,
                          child: Image.network(
                            _pelicula?['img_url2'] ?? '',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image),
                          ),
                        ),
                        SizedBox(height: 10.h),

                        // Título
                        SizedBox(
                          width: 330.w,
                          child: Text(
                            _pelicula?['Titulo'] ?? 'Sin título',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.textPrimary,
                            ),
                          ),
                        ),

                        SizedBox(height: 10.h),

                        // Favoritos, Deseados  y Calificacion
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 65.h,
                                      child: Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              esFavorito
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: Appcolors.heart,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (esFavorito) {
                                                  _pelicula?['favoritos']
                                                      ?.remove(
                                                        widget.idusuario,
                                                      );
                                                } else {
                                                  _pelicula?['favoritos']?.add(
                                                    widget.idusuario,
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            'Favorito',
                                            style: AppTexts.subboton,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 65.w,
                                      child: Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              esDeseado
                                                  ? Icons.bookmark
                                                  : Icons.bookmark_border,
                                              color: Appcolors.star,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                if (esDeseado) {
                                                  _pelicula?['deseados']
                                                      ?.remove(
                                                        widget.idusuario,
                                                      );
                                                } else {
                                                  _pelicula?['deseados']?.add(
                                                    widget.idusuario,
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            'Mi lista',
                                            style: AppTexts.subboton,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Calificacion(
                                  idlibro: widget.idpelicula,
                                  idlector: widget.idusuario,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Espaciado(
                          ancho: 350,
                          alto: 5,
                          topMargin: 6,
                          botMargin: 6,
                        ),

                        // Sinopsis
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 28.w),
                          child: Text(
                            _pelicula?['Sinopsis'] ??
                                'Sin sinopsis disponible.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Appcolors.textPrimary,
                            ),
                          ),
                        ),
                        Espaciado(
                          ancho: 350,
                          alto: 5,
                          topMargin: 6,
                          botMargin: 6,
                        ),

                        // Tabla de datos
                        SizedBox(
                          width: 350.w,
                          child: Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(
                                width: 2.h,
                                color: Appcolors.componentoff,
                              ),
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(3),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Director',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _pelicula?['Director'] ?? 'No definido',
                                      style: TextStyle(color: Appcolors.textPrimary),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Género',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _pelicula?['Genero'] ?? 'No definido',
                                      style: TextStyle(color: Appcolors.textPrimary),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Elenco',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Appcolors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      (_pelicula?['Elenco'] as List).join(', '),
                                      style: TextStyle(color: Appcolors.textPrimary),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Espaciado(
                          ancho: 350,
                          alto: 5,
                          topMargin: 6,
                          botMargin: 10,
                        ),
                        CartaRecomendacion(idusuario: widget.idusuario),
                        Espaciado(
                          ancho: 350,
                          alto: 5,
                          topMargin: 10,
                          botMargin: 10,
                        ),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}
