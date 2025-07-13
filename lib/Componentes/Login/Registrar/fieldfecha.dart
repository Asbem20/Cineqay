import 'package:cineqay/Disenos/app_colors.dart';
import 'package:cineqay/Disenos/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFieldfecha extends StatefulWidget {
  final TextEditingController controller;
  const AppFieldfecha({super.key, required this.controller});

  @override
  State<AppFieldfecha> createState() => _AppFieldfechaState();
}

class _AppFieldfechaState extends State<AppFieldfecha> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formatted =
          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      setState(() {
        widget.controller.text = formatted;
      });
    }

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha de nacimiento', style: AppTexts.headers),
            SizedBox(height: 3.h, width: 315.w),
            Container(
              width: 315.w,
              height: 45.h,
              alignment: Alignment.center,
              child: TextFormField(
                style: AppTexts.general,
                controller: widget.controller,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Selecciona una fecha',
                  hintStyle: TextStyle(color: Appcolors.textPrimary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 12.w,
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: _selectDate,
              ),
            ),
            SizedBox(height: 15.h, width: 315.w),
          ],
        );
      },
    );
  }
}
