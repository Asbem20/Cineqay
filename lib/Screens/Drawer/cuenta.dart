import 'package:cineqay/Componentes/Menu_Principal/itemprofile.dart';
import 'package:cineqay/Disenos/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cuenta extends StatefulWidget {
  final Map<String, dynamic> usuario; // <== Agregado

  const Cuenta({super.key, required this.usuario}); // <== Modificado

  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  
  // Formatea la fecha
  static String _formatearFecha(String fechaISO) {
    final partes = fechaISO.split('-');
    return '${partes[2]}/${partes[1]}/${partes[0]}';
  }

  @override
  Widget build(BuildContext context) {
    final usuarioActual = widget.usuario; // <== Usa el usuario pasado

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),

            const CircleAvatar(
              radius: 70,
              backgroundColor: Appcolors.secondary,
              child: Icon(Icons.person, size: 70, color: Appcolors.textPrimary),
            ),

            const SizedBox(height: 20),

            ItemProfile(
              title: 'Nombres',
              subtitle: usuarioActual['nombre'],
              iconData: CupertinoIcons.person,
            ),
            const SizedBox(height: 10),
            ItemProfile(
              title: 'Apellidos',
              subtitle: usuarioActual['apellido'],
              iconData: CupertinoIcons.person,
            ),
            const SizedBox(height: 10),
            ItemProfile(
              title: 'Fecha de nacimiento',
              subtitle: _formatearFecha(usuarioActual['fechanaci']),
              iconData: CupertinoIcons.calendar,
            ),
            const SizedBox(height: 10),
            ItemProfile(
              title: 'Email',
              subtitle: usuarioActual['email'],
              iconData: CupertinoIcons.mail,
            ),
          ],
        ),
      ),
    );
  }
}
