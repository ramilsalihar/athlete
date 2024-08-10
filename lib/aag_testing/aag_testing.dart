import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';

class AagTesting extends StatefulWidget {
  const AagTesting({super.key});

  @override
  State<AagTesting> createState() => _AagTestingState();
}

class _AagTestingState extends State<AagTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Testing',
          style: AagAppFonts.s20w700,
        ),
      ),
    );
  }
}
