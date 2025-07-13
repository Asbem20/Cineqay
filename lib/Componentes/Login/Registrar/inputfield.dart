import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputfield extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscuretext;
  final String? Function(String?)? validator;
  final TextStyle? labelStyle;
  final TextStyle? textFieldStyle;
  final InputDecoration? decoration;

  const AppInputfield({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.labelStyle,
    this.textFieldStyle,
    this.decoration,
    this.obscuretext = false,
    this.validator,
  });

  @override
  State<AppInputfield> createState() => _AppInputfieldState();
}

class _AppInputfieldState extends State<AppInputfield> {
  late bool _obscure;
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscuretext;
    _focus = FocusNode();
    _focus.addListener(() {
      setState(() {});
    });
  }

  void _toggleVisibility() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: widget.labelStyle ?? AppTexts.headers),
        SizedBox(height: 3.h, width: 315.w),
        Container(
          width: 315.w,
          height: 45.h,
          alignment: Alignment.center,
          child: Center(
            child: TextFormField(
              focusNode: _focus,
              cursorColor: Appcolors.textPrimary,
              controller: widget.controller,
              obscureText: _obscure,
              validator: widget.validator,
              style: widget.textFieldStyle ?? AppTexts.general,
              textAlignVertical: TextAlignVertical.center,
              decoration:
                  widget.decoration ??
                  InputDecoration(
                    hintText: widget.hint,
                    hintStyle: TextStyle(color: Appcolors.textPrimary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Appcolors.textPrimary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 12.w,
                    ),
                    suffixIcon:
                        widget.obscuretext
                            ? IconButton(
                              icon: Icon(
                                _obscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color:
                                    _focus.hasFocus
                                        ? Appcolors.textPrimary
                                        : null,
                              ),
                              onPressed: _toggleVisibility,
                            )
                            : null,
                  ),
            ),
          ),
        ),
        SizedBox(height: 15.h, width: 315.w),
      ],
    );
  }
}
