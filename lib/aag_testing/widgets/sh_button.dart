import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShButton extends StatelessWidget {
  const ShButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width = double.infinity,
    this.isOutlined = false,
  });

  final VoidCallback onPressed;
  final String title;
  final double width;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 56.h,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : AagAppColors.blue,
          borderRadius: BorderRadius.circular(16),
          border: isOutlined
              ? Border.all(
                  color: AagAppColors.blue,
                  width: 1,
                )
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: AagAppFonts.s16w500.copyWith(
              color: isOutlined ? AagAppColors.blue : Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
