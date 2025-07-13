import 'package:cineqay/Componentes/Menu_Principal/itemprofile.dart';
import 'package:cineqay/Disenos/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Widget que muestra la información del usuario actual
class Cuenta extends StatelessWidget {
  final Map<String, dynamic> usuario;

  const Cuenta({super.key, required this.usuario});

  // Formatea la fecha tipo 'YYYY-MM-DD' a 'DD/MM/YYYY'
  static String _formatearFecha(String fechaISO) {
    final partes = fechaISO.split('-');
    return '${partes[2]}/${partes[1]}/${partes[0]}';
  }

  @override
  Widget build(BuildContext context) {
    final usuarioActual = usuario; // Acede a los datos del usuario

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Avatar circular del perfil
            const CircleAvatar(
              radius: 70,
              backgroundColor: Appcolors.secondary,
              child: Icon(Icons.person, size: 70, color: Appcolors.textPrimary),
            ),
            const SizedBox(height: 20),
            // Widgets personalizados para el diseño de los contenedores
            ItemProfile(
              title: 'Nombres', // Nombres
              subtitle: usuarioActual['nombre'],
              iconData: CupertinoIcons.person,
            ),
            const SizedBox(height: 10),
            ItemProfile(
              title: 'Apellidos', // Apellidos
              subtitle: usuarioActual['apellido'],
              iconData: CupertinoIcons.person,
            ),
            const SizedBox(height: 10),
            ItemProfile(
              title: 'Fecha de nacimiento', // Fecha de Nacimiento
              subtitle: _formatearFecha(usuarioActual['fechanaci']),
              iconData: CupertinoIcons.calendar,
            ),
            const SizedBox(height: 10),
            ItemProfile(
              title: 'Email', // Email
              subtitle: usuarioActual['email'],
              iconData: CupertinoIcons.mail,
            ),
          ],
        ),
      ),
    );
  }
}
