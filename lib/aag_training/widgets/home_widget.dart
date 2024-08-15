import 'package:athlete_go/aag_training/widgets/dn.dart';
import 'package:athlete_go/aag_training/workout_details.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.model});
  final TrainDn model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutDetails(
              model: model,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            width: double.infinity,
            height: 120.h,
            child: Row(
              children: [
                Image.asset(
                  model.image,
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${model.det.length} exercises',
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/rightICon.png',
                  width: 24.w,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0.r,
            right: 14.w,
            child: Container(
              width: 80,
              height: 20.h,
              decoration: const BoxDecoration(
                color: AagAppColors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: Center(
                child: Text(
                  'Beginner',
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
