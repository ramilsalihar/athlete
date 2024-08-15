import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ShWaterWidget extends StatefulWidget {
  const ShWaterWidget({super.key});

  @override
  State<ShWaterWidget> createState() => _ShWaterWidgetState();
}

class _ShWaterWidgetState extends State<ShWaterWidget> {
  int _currentIntake = 1;
  final int _goalIntake = 8;

  void _incrementIntake() {
    setState(() {
      if (_currentIntake < _goalIntake) {
        _currentIntake++;
      }
    });
  }

  void _decrementIntake() {
    setState(() {
      if (_currentIntake > 0) {
        _currentIntake--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AagAppColors.blueBg,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Water",
                style: AagAppFonts.s14w600.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                size: 20.0,
              ),
            ],
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 28.0,
                  ),
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    percent: _currentIntake / _goalIntake,
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/droplet.png',
                          width: 35.0,
                        ),
                        Text(
                          "$_currentIntake/$_goalIntake",
                          style: AagAppFonts.s16w500.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    progressColor: AagAppColors.primary,
                    backgroundColor: Colors.white,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: _decrementIntake,
                  icon: Image.asset('assets/icons/minus_water.png'),
                  iconSize: 30.0,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: _incrementIntake,
                  icon: Image.asset('assets/icons/add_water.png'),
                  iconSize: 30.0,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
