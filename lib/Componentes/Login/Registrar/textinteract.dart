import 'package:cineqay/Disenos/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextinteract extends StatelessWidget {
  final String textoNormal;
  final String textoLink;
  final VoidCallback onTap;
  const AppTextinteract({
    super.key,
    required this.textoNormal,
    required this.textoLink,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.w,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: textoNormal,
                    style: AppTexts.general,
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(text: textoLink, style: AppTexts.link),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
