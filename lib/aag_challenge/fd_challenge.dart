import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';

class AagChallenge extends StatefulWidget {
  const AagChallenge({super.key});

  @override
  State<AagChallenge> createState() => _AagChallengeState();
}

class _AagChallengeState extends State<AagChallenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Challenge',
          style: AagAppFonts.s20w700,
        ),
      ),
    );
  }
}
