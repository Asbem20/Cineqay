import 'package:cineqay/Componentes/Menu_Principal/barra.dart';
import 'package:cineqay/Componentes/Menu_Principal/drawer.dart';
import 'package:cineqay/Disenos/fondo.dart';
import 'package:cineqay/Screens/Drawer/cuenta.dart';
import 'package:cineqay/Screens/Drawer/deseados.dart';
import 'package:cineqay/Screens/Drawer/favoritos.dart';
import 'package:cineqay/Screens/Drawer/inicio.dart';
import 'package:cineqay/Screens/login.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final Map<String, dynamic> usuario; // Usuario que inicia sesión

  const Menu({super.key, required this.usuario});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Lista de vistas con usuario como parámetro
    final List<Widget> vistas = [
      Inicio(usuario: widget.usuario),
      Cuenta(usuario: widget.usuario),
      Favoritos(usuario: widget.usuario),
      Deseados(usuario: widget.usuario)
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarra(),
      drawer: AppDrawer(
        onitemselected: (int index) {
          if (index == 4) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const Login()),
              (route) => false,
            );
          } else {
            setState(() {
              selectedIndex = index;
            });
          }
        },
        usuario: widget.usuario,
      ),
      body: FondoDegradado(
        child: IndexedStack(index: selectedIndex, children: vistas),
      ),
    );
  }
}
