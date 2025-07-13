import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:flutter/material.dart';

class AppBarra extends StatelessWidget implements PreferredSizeWidget {
  const AppBarra({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolors.secondary,
      foregroundColor: Appcolors.textPrimary,
      title: Text("Cineqay"),
      centerTitle: true,
      titleTextStyle: AppTexts.title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
