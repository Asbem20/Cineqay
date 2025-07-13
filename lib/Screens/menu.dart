import 'package:cineqay/Componentes/Menu_Principal/barra.dart';
import 'package:cineqay/Componentes/Menu_Principal/drawer.dart';
import 'package:cineqay/Disenos/fondo.dart';
import 'package:cineqay/Screens/Drawer/cuenta.dart';
import 'package:cineqay/Screens/Drawer/deseados.dart';
import 'package:cineqay/Screens/Drawer/favoritos.dart';
import 'package:cineqay/Screens/Drawer/inicio.dart';
import 'package:cineqay/Screens/login.dart';
import 'package:flutter/material.dart'; // Importación

// Clase principal del menú, recibe el usuario autenticado
class Menu extends StatefulWidget {
  final Map<String, dynamic> usuario; // Usuario que inició sesión

  const Menu({super.key, required this.usuario});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0; // Índice de la vista seleccionada (por defecto la primera)

  @override
  Widget build(BuildContext context) {
    // Lista de pantallas que el usuario puede ver según el Drawer
    final List<Widget> vistas = [
      Inicio(usuario: widget.usuario),      // Vista principal
      Cuenta(usuario: widget.usuario),      // Perfil / Cuenta
      Favoritos(usuario: widget.usuario),   // Lista de favoritos
      Deseados(usuario: widget.usuario),    // Lista de deseados
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarra(), // AppBar personalizado
      drawer: AppDrawer( // Drawer personalizado
        onitemselected: (int index) {
          // Si el usuario selecciona "Cerrar sesión" (índice 4)
          if (index == 4) {
            // Navega a la pantalla de Login y elimina todas las rutas anteriores
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const Login()),
              (route) => false, // Remueve todas las rutas anteriores
            );
          } else {
            // Cambia la vista mostrada según el índice seleccionado
            setState(() {
              selectedIndex = index;
            });
          }
        },
        usuario: widget.usuario, // Se pasa el usuario al Drawer
      ),
      // Fondo degradado y cuerpo principal según el índice seleccionado
      body: FondoDegradado(
        child: IndexedStack(
          index: selectedIndex, // Muestra la vista activa
          children: vistas,     // Lista de widgets/pantallas
        ),
      ),
    );
  }
}

