import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShButton extends StatelessWidget {
  const ShButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          color: AagAppColors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(title,
              style: AagAppFonts.s16w500.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}
