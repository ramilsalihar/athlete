import 'package:flutter/material.dart';

class AagTextField extends StatelessWidget {
  final String hintText;
  final int maxLine;

  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? icon;
  final Widget? prefIcon;

  const AagTextField({
    super.key,
    required this.hintText,
    required this.maxLine,
    this.textInputType,
    this.controller,
    this.onChanged,
    this.icon,
    this.prefIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLine,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.white,
        suffixIcon: icon,
        prefixIcon: prefIcon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffE2E2E2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xffE2E2E2))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xffE2E2E2))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
