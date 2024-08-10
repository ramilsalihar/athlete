import 'package:athlete_go/aag_challenge/fd_challenge.dart';
import 'package:athlete_go/aag_training/aag_training.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';

import 'package:athlete_go/aag_testing/aag_testing.dart';
import 'package:athlete_go/settings/aag_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AagDownBar extends StatefulWidget {
  const AagDownBar({
    super.key,
    this.indexScr = 0,
  });
  final int indexScr;

  @override
  State<AagDownBar> createState() => _AagDownBarState();
}

class _AagDownBarState extends State<AagDownBar> {
  late int _currentIndex;
  final List<Widget> _pages = const [
    AagTraining(),
    AagChallenge(),
    AagTesting(),
    AagSettings(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.indexScr;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildNavItem(int index, String iconPath, String text) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        height: 70.h,
        width: 64.w,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              color: _currentIndex == index
                  ? AagAppColors.primary
                  : AagAppColors.grey,
              width: 24.w,
            ),
            _currentIndex == index
                ? Text(
                    text,
                    style: AagAppFonts.s10w400
                        .copyWith(color: AagAppColors.primary),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 16.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(0, 'assets/icons/1.png', 'Training'),
            _buildNavItem(1, 'assets/icons/2.png', 'Challange'),
            _buildNavItem(2, 'assets/icons/3.png', 'Testing'),
            _buildNavItem(3, 'assets/icons/4.png', 'Settings'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AagDownBar(),
    );
  }
}
