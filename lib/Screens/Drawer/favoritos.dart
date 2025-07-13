import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Screens/datolibro.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/listas.dart';

class Favoritos extends StatelessWidget {
  final Map<String, dynamic> usuario;

  const Favoritos({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    // Filtrar películas favoritas del usuario
    final List<Map<String, dynamic>> favoritosUsuario =
        peliculas.where((pelicula) {
          return pelicula['favoritos'] != null &&
              pelicula['favoritos'].contains(usuario['idusuario']);
        }).toList();

    return favoritosUsuario.isEmpty
        ? const Center(
          child: Text(
            'No tienes películas favoritas aún.',
            style: TextStyle(color: Appcolors.textPrimary),
          ),
        )
        : ListView.builder(
          itemCount: favoritosUsuario.length,
          itemBuilder: (context, index) {
            final pelicula = favoritosUsuario[index];
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
