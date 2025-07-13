import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Screens/datolibro.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/listas.dart';

class Deseados extends StatelessWidget {
  final Map<String, dynamic> usuario;

  const Deseados({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    // Filtrar peliculas deseadas del usuario
    final List<Map<String, dynamic>> deseadosUsuario =
        peliculas.where((pelicula) {
          return pelicula['deseados'] != null &&
              pelicula['deseados'].contains(usuario['idusuario']);
        }).toList();

    return deseadosUsuario.isEmpty
        ? const Center(
          child: Text(
            'No tienes películas deseadas aún.',
            style: TextStyle(color: Appcolors.textPrimary),
          ),
        )
        : ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: deseadosUsuario.length,
          itemBuilder: (context, index) {
            final pelicula = deseadosUsuario[index];
            return ListTile(
              leading: Image.network(
                pelicula['img_url'],
                width: 50,
                height: 75,
                fit: BoxFit.cover,
              ),
              title: Text(pelicula['Titulo'], style: AppTexts.general),
              subtitle: Text(pelicula['Genero'], style: AppTexts.subgeneral),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                color: Appcolors.textPrimary,
                onPressed: () {
                  // Navegar a la pantalla de detalle de la película
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Datolibro(
                            idpelicula: pelicula['idpelicula'],
                            idusuario: usuario['idusuario'],
                          ),
                    ),
                  );
                },
              ),
            );
          },
        );
  }
}
