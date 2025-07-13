import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Screens/datolibro.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/listas.dart';

// Widget que muestra una lista con las películas favoritos del usuario
class Favoritos extends StatelessWidget {
  final Map<String, dynamic> usuario; // Mapa con los datos del usuario actual

  const Favoritos({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    // Filtra las películas favoritas del usuario
    final List<Map<String, dynamic>> favoritosUsuario =
        peliculas.where((pelicula) {
          // Verifica que la lista favoritos exista y contenga el ID del usuario
          return pelicula['favoritos'] != null &&
              pelicula['favoritos'].contains(usuario['idusuario']);
        }).toList();
    // Si no tiene películas favoritas, muestra un mensaje
    return favoritosUsuario.isEmpty
        ? const Center(
          child: Text(
            'No tienes películas favoritas aún.',
            style: TextStyle(color: Appcolors.textPrimary),
          ),
        )
        // Sino, muestra una lista con las películas favoritas
        : ListView.builder(
          itemCount: favoritosUsuario.length,
          itemBuilder: (context, index) {
            final pelicula = favoritosUsuario[index]; // Película actual
            return ListTile(
              // Imagen de la película
              leading: Image.network(
                pelicula['img_url'],
                width: 50,
                height: 75,
                fit: BoxFit.cover,
              ),
              title: Text(pelicula['Titulo'], style: AppTexts.general), // Titulo
              subtitle: Text(pelicula['Genero'], style: AppTexts.subgeneral), // Género
              // Ícono botón para navegar a la página del respectivo libro
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
