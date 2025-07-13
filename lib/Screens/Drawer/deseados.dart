import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Screens/datolibro.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/listas.dart';

// Widget que muestra la lista de películas deseadas por el usuario
class Deseados extends StatelessWidget {
  final Map<String, dynamic> usuario; // Mapa con los datos del usuario

  const Deseados({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    // Filtra peliculas deseadas del usuario
    final List<Map<String, dynamic>> deseadosUsuario =
        peliculas.where((pelicula) {
          // Verifica que la lista deseados exista y contenga el ID del usuario
          return pelicula['deseados'] != null &&
              pelicula['deseados'].contains(usuario['idusuario']);
        }).toList();
    // Si no tiene películas deseadas, muestra un mensaje
    return deseadosUsuario.isEmpty
        ? const Center(
          child: Text(
            'No tienes películas deseadas aún.',
            style: TextStyle(color: Appcolors.textPrimary),
          ),
        )
        // Sino, muestra la lista de las películas deseadas
        : ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: deseadosUsuario.length,
          itemBuilder: (context, index) {
            final pelicula = deseadosUsuario[index]; // Película actual
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
                  // Navega a la pantalla de detalle de la película
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
