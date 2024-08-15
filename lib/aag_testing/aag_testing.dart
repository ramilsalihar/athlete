import 'package:athlete_go/aag_testing/widgets/sh_water_widget.dart';
import 'package:athlete_go/aag_testing/widgets/sh_weight_widget.dart';
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
          'Sport and Health',
          style: AagAppFonts.s20w700,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ShWaterWidget(),
                ShWeightWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
