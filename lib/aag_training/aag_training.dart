import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';

class AagTraining extends StatefulWidget {
  const AagTraining({super.key});

  @override
  State<AagTraining> createState() => _AagTrainingState();
}

class _AagTrainingState extends State<AagTraining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Training',
          style: AagAppFonts.s20w700,
        ),
      ),
    );
  }
}
