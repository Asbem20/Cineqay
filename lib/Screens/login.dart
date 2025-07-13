import 'package:cineqay/Componentes/Login/Registrar/inputfield.dart';
import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:cineqay/Disenos/fondo.dart';
import 'package:cineqay/Screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cineqay/listas.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Función para verificar si el usuario existe
  void _handleLogin() {
    final email = emailController.text.trim();
    final pass = passwordController.text;

    if (email.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, complete todos los campos.')),
      );
      return;
    }
    // Buscar el usuario en la lista
    final user = usuarios.firstWhere(
      (u) => u['email'] == email && u['contra'] == pass,
      orElse: () => {},
    );
    if (user.isNotEmpty) {
      // Login exitoso, lo manda al menú principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Menu(usuario: user)),
      );
    } else {
      // Usuario no encontrado, bota un error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email o contraseña incorrectos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FondoDegradado(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 220.w,
                        child: Text(
                          'BIENVENIDO A CINEQAY',
                          textAlign: TextAlign.center,
                          style: AppTexts.wordart,
                        ),
                      ),
                      SizedBox(width: 315.w, height: 71.h),
                      // Campos de Entrada
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
                        onPressed: _handleLogin,
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
