import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Disenos/fondo.dart';
import 'package:flutter/material.dart';
import 'package:cineqay/Screens/login.dart';
import 'package:cineqay/Disenos/app_colors.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onitemselected;
  final Map<String, dynamic> usuario;

  const AppDrawer({
    super.key,
    required this.onitemselected,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FondoDegradado(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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

            ListTile(
              leading: const Icon(Icons.home, color: Appcolors.textPrimary),
              title: const Text('Inicio', style: AppTexts.general),
              onTap: () {
                onitemselected(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Appcolors.textPrimary),
              title: const Text('Cuenta', style: AppTexts.general),
              onTap: () {
                onitemselected(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Appcolors.textPrimary),
              title: const Text('Favoritos', style: AppTexts.general),
              onTap: () {
                onitemselected(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark, color: Appcolors.textPrimary),
              title: const Text('Deseados', style: AppTexts.general),
              onTap: () {
                onitemselected(3);
                Navigator.pop(context);
              },
            ),
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
