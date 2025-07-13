import 'package:cineqay/Disenos/app_colors.dart';
import 'package:flutter/material.dart';

class FondoDegradado extends StatelessWidget {
  final Widget child;
  const FondoDegradado({super.key, required this.child});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Appcolors.primary,
            Appcolors.secondary
          ])
      ),
      child: child
    );
  }
}