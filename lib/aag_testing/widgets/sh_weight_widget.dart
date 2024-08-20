import 'package:athlete_go/aag_testing/logic/sh_provider.dart';
import 'package:athlete_go/aag_testing/widgets/sh_weight_screen.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShWeightWidget extends StatefulWidget {
  const ShWeightWidget({super.key});

  @override
  State<ShWeightWidget> createState() => _ShWeightWidgetState();
}

final List<String> days = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];

class _ShWeightWidgetState extends State<ShWeightWidget> {
  int _leftWeight = 0;
  int _rightWeight = 0;

  String getWeekDay() {
    return days[DateTime.now().weekday - 2 % 7];
  }

  String getToday() {
    return days[DateTime.now().weekday - 1 % 7];
  }

  @override
  initState() {
    _rightWeight = Provider.of<ShProvider>(context, listen: false)
            .getWeight()
            .stats[getToday()] ??
        0;
    _leftWeight = Provider.of<ShProvider>(context, listen: false)
            .getWeight()
            .stats[getWeekDay()] ??
        0;
    super.initState();
  }

  void _incrementRightWeight() {
    setState(() {
      _rightWeight++;
    });
  }

  void _decrementLeftWeight() {
    setState(() {
      _rightWeight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      // height: width * 0.55,
      width: width * 0.45,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Weight",
                style: AagAppFonts.s14w600.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                ),
                iconSize: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ShWeightScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 12.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$_leftWeight',
                style: AagAppFonts.s16w400.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Image.asset(
                'assets/icons/weight_icon.png',
                height: 60.0,
              ),
              Text(
                '$_rightWeight',
                style: AagAppFonts.s16w400.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _decrementLeftWeight,
                icon: Image.asset('assets/icons/minus_weight.png'),
                iconSize: 30.0,
              ),
              IconButton(
                onPressed: _incrementRightWeight,
                icon: Image.asset('assets/icons/add_weight.png'),
                iconSize: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
