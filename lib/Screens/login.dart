import 'package:cineqay/Componentes/Login/Registrar/inputfield.dart';
import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Disenos/fondo.dart';
import 'package:cineqay/Screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cineqay/listas.dart'; // Importación 

// Libera los controladores cuando el widget se destruye
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// Función que verifica si el usuario existe
  void _handleLogin() {
    final email = emailController.text.trim(); // Elimina espacios
    final pass = passwordController.text.trim();

    // Validación básica
    if (email.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, complete todos los campos.')),
      );
      return;
    }

    // Busca un usuario válido en la lista de usuarios
    final user = usuarios.firstWhere(
      (u) => u['email'] == email && u['contra'] == pass,
      orElse: () => {}, // Devuelve un mapa vacío si no lo encuentra
    );

    if (user.isNotEmpty) {
      // Si el usuario existe, redirige al menú principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Menu(usuario: user)),
      );
    } else {
      // Si no se encuentra, muestra mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email o contraseña incorrectos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Fondo transparente para el degradado
      body: FondoDegradado( // Widget personalizado con fondo degradado
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
                    crossAxisAlignment: CrossAxisAlignment.center, // Centrado horizontal
                    children: [
                      // Texto de bienvenida
                      SizedBox(
                        width: 220.w,
                        child: Text(
                          'BIENVENIDO A CINEQAY',
                          textAlign: TextAlign.center,
                          style: AppTexts.wordart,
                        ),
                      ),
                      SizedBox(width: 315.w, height: 71.h),

                      // Campos de entrada con widgets personalizados
                      Column(
                        children: [
                          AppInputfield(
                            label: 'Email',
                            hint: 'Ingrese su email',
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Este campo es obligatorio';
                              }
                              return null;
                            },
                          ),
                          AppInputfield(
                            label: 'Contraseña',
                            hint: 'Ingrese su contraseña',
                            obscuretext: true,
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Este campo es obligatorio';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(width: 390.w, height: 40.h),

                      // Botón para iniciar sesión
                      ElevatedButton(
                        onPressed: _handleLogin, // Acción al presionar
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.backgroundComponent,
                          minimumSize: Size(315.w, 45.h),
                        ),
                        child: Text('INICIAR SESIÓN', style: AppTexts.btn),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
