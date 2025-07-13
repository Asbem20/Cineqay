import 'package:cineqay/Disenos/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBuscador extends StatefulWidget {
  final ValueChanged<String>? onChanged; // Función a ejecutar cuando sucedan cambios
  final TextEditingController controller; // Controlador para recibir el texto
  const AppBuscador({super.key, this.onChanged,required this.controller});

  @override
  State<AppBuscador> createState() => _AppBuscadorState();
}

class _AppBuscadorState extends State<AppBuscador> {
  late FocusNode _focus; /*Variable para la edición de diseño en el focus,
                           cuando el buscador es seleccionado */
  @override
  void initState() {
    super.initState();
    _focus = FocusNode();
    _focus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: widget.controller,
      hintText: 'Busque su película',
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Appcolors.textPrimary,
          fontSize: 17.sp,
          fontFamily: 'Cocogoose',
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(Appcolors.secondary),
      leading: Icon(Icons.search, size: 22.h, color: Appcolors.textPrimary),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 12.w)),
      shadowColor: WidgetStatePropertyAll(Appcolors.secondary),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.h),
          side: BorderSide.none,
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
