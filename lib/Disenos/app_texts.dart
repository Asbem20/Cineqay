import 'package:cineqay/Disenos/app_colors.dart';
import 'package:flutter/material.dart';

class AppTexts {
  // Titulos
  static TextStyle wordart = TextStyle(
    fontSize: 32,
    foreground:
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = Appcolors.textPrimary,
  );
  static const TextStyle title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Appcolors.textPrimary,
  );

  // Subtitulo
  static const TextStyle headers = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Appcolors.textPrimary,
  );
  static const TextStyle subheaders = TextStyle(fontSize: 18);
  static const TextStyle subgeneral = TextStyle(
    fontSize: 12,
    color: Appcolors.textPrimary,
  );
  
  // Texto Normal
  static const TextStyle general = TextStyle(
    fontSize: 14,
    color: Appcolors.textPrimary,
  );

  // Extras
  static TextStyle btn = TextStyle(
    fontSize: 14,
    color: Appcolors.textPrimary,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subboton = TextStyle(
    fontSize: 12,
    color: Appcolors.border,
  );

  static const TextStyle link = TextStyle(
    fontSize: 14,
    color: Appcolors.textUnderline,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
}
