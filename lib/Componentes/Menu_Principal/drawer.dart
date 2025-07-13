import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Disenos/fondo.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/Screens/login.dart';
import 'package:cineqay/Disenos/app_colors.dart';

// Widget de drawer personalizado que permite navegación lateral
class AppDrawer extends StatelessWidget {
  final Function(int) onitemselected; // Callback que indica qué sección se seleccionó
  final Map<String, dynamic> usuario; // Mapa con los datos del usuario actual

  const AppDrawer({
    super.key,
    required this.onitemselected,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FondoDegradado( // Fondo personalizado
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Encabezado del drawer
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Appcolors.secondary),
              accountName: Text('${usuario['nombre']} ${usuario['apellido']}'),
              accountEmail: Text(usuario['email']),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Appcolors.secondary,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Appcolors.textPrimary,
                ),
              ),
            ),
            // Inicio
            ListTile(
              leading: const Icon(Icons.home, color: Appcolors.textPrimary),
              title: const Text('Inicio', style: AppTexts.general),
              onTap: () {
                onitemselected(0);
                Navigator.pop(context);
              },
            ),
            // Cuenta
            ListTile(
              leading: const Icon(Icons.person, color: Appcolors.textPrimary),
              title: const Text('Cuenta', style: AppTexts.general),
              onTap: () {
                onitemselected(1);
                Navigator.pop(context);
              },
            ),
            // Favoritos
            ListTile(
              leading: const Icon(Icons.favorite, color: Appcolors.textPrimary),
              title: const Text('Favoritos', style: AppTexts.general),
              onTap: () {
                onitemselected(2);
                Navigator.pop(context);
              },
            ),
            // Deseados
            ListTile(
              leading: const Icon(Icons.bookmark, color: Appcolors.textPrimary),
              title: const Text('Deseados', style: AppTexts.general),
              onTap: () {
                onitemselected(3);
                Navigator.pop(context);
              },
            ),
            // Cerrar Sesión
            ListTile(
              leading: const Icon(Icons.logout, color: Appcolors.textPrimary),
              title: const Text('Cerrar sesión', style: AppTexts.general),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
