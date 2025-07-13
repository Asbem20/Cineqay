import 'package:cineqay/Componentes/Menu_Principal/buscadorbtn.dart';
import 'package:cineqay/Componentes/Menu_Principal/cartilla_pelicula.dart';
import 'package:cineqay/Componentes/Menu_Principal/titulos_catalogo.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/listas.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Widget que muestra el contenido de inicio (buscador y cátalogo)
class Inicio extends StatefulWidget {
  final Map<String, dynamic> usuario; // Mapa con los datos del usuario actual

  const Inicio({super.key, required this.usuario});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<Map<String, dynamic>> resultados = []; // Lista de películas que coincidan con la búsqueda
  // Lista separadas de widgets personalizados por género
  late List<CartillaPelicula> peliculasWidget;
  late List<CartillaPelicula> peliculasTerror;
  late List<CartillaPelicula> peliculasComedia;
  late List<CartillaPelicula> peliculasAnimados;
  late List<CartillaPelicula> peliculasSuspenso;
  // Controlador del textfield de búsqueda
  final TextEditingController _buscadorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    resultados = peliculas; // Por defecto muestra todas las películas
    // La lista de mapas se transforman en un widget personalizado por género
    peliculasWidget =
        peliculas.map((pelicula) {
          return CartillaPelicula(
            urlImagen: pelicula['img_url'],
            tituloPelicula: pelicula['Titulo'],
            sinopsis: pelicula['Sinopsis'],
            calificacion: calcularCalificacionPromedio(
              pelicula['calificaciones'],
            ),
            pelicula: pelicula,
            usuario: widget.usuario,
          );
        }).toList();

    // Filtrado de películas por género
    peliculasTerror = filtrarPeliculasPorGenero('Terror');
    peliculasComedia = filtrarPeliculasPorGenero('Comedia');
    peliculasAnimados = filtrarPeliculasPorGenero('Animados');
    peliculasSuspenso = filtrarPeliculasPorGenero('Suspenso');
  }

  // Función de búsqueda
  void _buscar(String query) {
    setState(() {
      // Filtra las películas por título y género
      resultados =
          peliculas
              .where(
                (p) =>
                    p['Titulo'].toLowerCase().contains(query.toLowerCase()) ||
                    p['Genero'].toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  // Calcula el promedio de calificaciones
  String calcularCalificacionPromedio(List<dynamic> calificaciones) {
    if (calificaciones.isEmpty) return '0';
    double promedio =
        calificaciones.reduce((a, b) => a + b) / calificaciones.length;
    return promedio.toStringAsFixed(1);
  }

  // Filtro por género, devuelve la lista de widgets
  List<CartillaPelicula> filtrarPeliculasPorGenero(String genero) {
    return peliculas
        .where(
          (pelicula) =>
              pelicula['Genero'].toString().toLowerCase() ==
              genero.toLowerCase(),
        )
        .map(
          (pelicula) => CartillaPelicula(
            urlImagen: pelicula['img_url'],
            tituloPelicula: pelicula['Titulo'],
            sinopsis: pelicula['Sinopsis'],
            calificacion: calcularCalificacionPromedio(
              pelicula['calificaciones'],
            ),
            pelicula: pelicula,
            usuario: widget.usuario,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // Determina si hay una búsqueda activa
    final bool hayBusqueda = _buscadorController.text.trim().isNotEmpty;
    // 
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          // Buscador
          SizedBox(
            width: 340.w,
            height: 45.h,
            child: AppBuscador(
              onChanged: _buscar,
              controller: _buscadorController,
            ),
          ),
          SizedBox(height: 10.h),
          // Si se ha usado el buscador, muestra resultados
          if (hayBusqueda) ...[
            TitulosCatalogo(
              textoComplemento: 'RESULTADOS DE',
              genero: ' BÚSQUEDA',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children:
                    resultados.map((pelicula) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: CartillaPelicula(
                          urlImagen: pelicula['img_url'],
                          tituloPelicula: pelicula['Titulo'],
                          sinopsis: pelicula['Sinopsis'],
                          calificacion: calcularCalificacionPromedio(
                            pelicula['calificaciones'],
                          ),
                          pelicula: pelicula,
                          usuario: widget.usuario,
                        ),
                      );
                    }).toList(),
              ),
            ),
          ]
          // Sino, mostrará las películas en secciones por género
          else ...[
            // Titulo --> Debe indicar el género naturalmente
            TitulosCatalogo(textoComplemento: 'LO MEJOR EN', genero: ' TERROR'),
            SizedBox(height: 10.h),
            // Es la zona del Slider, considera mostrar el catálogo con su respectiva película e información general
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SizedBox(
                height: 210.h,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  itemCount: peliculasTerror.length,
                  itemBuilder: (BuildContext context, int index) {
                    return peliculasTerror[index];
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            /* SECCIÓN TERROR */
            TitulosCatalogo(
              textoComplemento: 'RIETE CON NUESTRAS',
              genero: ' COMEDIAS',
            ),
            SizedBox(height: 10.h),
            // Es la zona del Slider, considera mostrar el catálogo con su respectiva película e información general
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SizedBox(
                height: 210.h,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  itemCount: peliculasComedia.length,
                  itemBuilder: (BuildContext context, int index) {
                    return peliculasComedia[index];
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            /* SECCIÓN ANIMADOS */
            TitulosCatalogo(
              textoComplemento: 'DISFRUTA DE CLÁSICOS',
              genero: ' ANIMADOS',
            ),
            SizedBox(height: 10.h),
            // Es la zona del Slider, considera mostrar el catálogo con su respectiva película e información general
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SizedBox(
                height: 210.h,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  itemCount: peliculasAnimados.length,
                  itemBuilder: (BuildContext context, int index) {
                    return peliculasAnimados[index];
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            /* SECCIÓN SUSPENSO */
            TitulosCatalogo(
              textoComplemento: '¿PUEDES CON EL',
              genero: ' SUSPENSO?',
            ),
            SizedBox(height: 10.h),
            // Es la zona del Slider, considera mostrar el catálogo con su respectiva película e información general
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SizedBox(
                height: 210.h,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  itemCount: peliculasSuspenso.length,
                  itemBuilder: (BuildContext context, int index) {
                    return peliculasSuspenso[index];
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ],
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
