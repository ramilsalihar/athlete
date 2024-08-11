import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';

class AddMy extends StatefulWidget {
  const AddMy({super.key});

  @override
  State<AddMy> createState() => _AddMyState();
}

class _AddMyState extends State<AddMy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: const BackButton(),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Add chellenge',
          style: AagAppFonts.s20w700,
        ),
      ),
    );
  }
}
