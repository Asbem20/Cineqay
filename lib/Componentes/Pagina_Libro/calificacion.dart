import 'package:cineqay/Disenos/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/listas.dart';

class Calificacion extends StatefulWidget {
  final int idlibro;
  final String idlector;

  const Calificacion({
    super.key,
    required this.idlibro,
    required this.idlector,
  });

  @override
  State<Calificacion> createState() => _CalificacionState();
}

class _CalificacionState extends State<Calificacion> {
  int calificacion = 0;
  double promedio = 0.0;
  int total = 0;

  @override
  void initState() {
    super.initState();
    _cargarCalificacion();
  }

  void _cargarCalificacion() {
    // Obtener calificación del usuario si existe
    final califUsuario = calificaciones.firstWhere(
      (calif) =>
          calif['idpelicula'] == widget.idlibro &&
          calif['idusuario'] == widget.idlector,
      orElse: () => {},
    );

    if (califUsuario.isNotEmpty) {
      calificacion = califUsuario['calificacion'] ?? 0;
    }

    // Calcular promedio
    final califPelicula =
        calificaciones.where((c) => c['idpelicula'] == widget.idlibro).toList();

    if (califPelicula.isNotEmpty) {
      total = califPelicula.length;
      final suma = califPelicula.fold<double>(
        0,
        (sum, item) => sum + ((item['calificacion'] ?? 0) as num).toDouble(),
      );
      promedio = (suma / total);
    }

    setState(() {});
  }

  void _guardarCalificacion(int nueva) {
    // Eliminar si ya existe
    calificaciones.removeWhere(
      (c) =>
          c['idpelicula'] == widget.idlibro &&
          c['idusuario'] == widget.idlector,
    );

    // Agregar nueva calificación si no es 0
    if (nueva > 0) {
      calificaciones.add({
        'idpelicula': widget.idlibro,
        'idusuario': widget.idlector,
        'calificacion': nueva,
      });
    }

    // Actualizar UI
    _cargarCalificacion();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: [
          Row(
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              return IconButton(
                icon: Icon(
                  Icons.star,
                  color:
                      index < calificacion
                          ? Appcolors.star
                          : Appcolors.componentoff,
                ),
                onPressed: () {
                  final nueva = (calificacion == starIndex) ? 0 : starIndex;
                  setState(() {
                    calificacion = nueva;
                  });
                  _guardarCalificacion(nueva);
                },
              );
            }),
          ),
          const SizedBox(width: 10),
          Text(
            promedio > 0 ? '${promedio.toStringAsFixed(1)}/5 ($total)' : '0/0',
            style: TextStyle(color: Appcolors.textPrimary),
          ),
        ],
      ),
    );
  }
}
