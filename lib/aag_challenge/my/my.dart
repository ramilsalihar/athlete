import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyChellange extends StatefulWidget {
  const MyChellange({
    super.key,
  });

  @override
  State<MyChellange> createState() => _MyChellangeState();
}

class _MyChellangeState extends State<MyChellange> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 150.h),
        Image.asset(
          'assets/images/nullImage.png',
          width: 60.w,
        ),
        Text(
          'You dont have any challenges created yet. Create your own challenge to track your progress and motivate yourself!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.h,
            fontWeight: FontWeight.w400,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
