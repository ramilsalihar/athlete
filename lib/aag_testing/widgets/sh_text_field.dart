import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ShTextField extends StatefulWidget {
  const ShTextField({
    super.key,
    required this.controller,
    required this.title,
    this.isDate = false,
  });

  final TextEditingController controller;
  final String title;
  final bool isDate;

  @override
  State<ShTextField> createState() => _ShTextFieldState();
}

class _ShTextFieldState extends State<ShTextField> {
  final String date = DateFormat('dd.MM.yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AagAppFonts.s14w600.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.0.h),
        TextFormField(
          readOnly: widget.isDate,
          controller: widget.controller,
          onChanged: (value) {
            setState(() {
              widget.controller.text = value;
            });
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: widget.isDate ? date : 'Enter your weight',
            hintStyle: AagAppFonts.s14w500.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
