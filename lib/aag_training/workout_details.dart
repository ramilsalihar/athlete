import 'package:athlete_go/aag_training/train_start.dart';
import 'package:athlete_go/aag_training/widgets/dn.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutDetails extends StatelessWidget {
  const WorkoutDetails({super.key, required this.model});
  final TrainDn model;

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
          'Workout details',
          style: AagAppFonts.s20w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(model.image),
              Center(
                child: Container(
                  width: 252.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AagAppColors.blueBg,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/timeIcon.png',
                        width: 32.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '${model.min} min',
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 30.h,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Image.asset(
                        'assets/images/fireIcon.png',
                        width: 32.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '${model.kcal} kcal',
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                model.subTitle,
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exercises',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '1/${model.det.length}',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shrinkWrap: true,
                itemCount: model.det.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) => WrkWidget(
                  model: model.det[index],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrainStart(
                        model: model,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AagAppColors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 22.h,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class WrkWidget extends StatelessWidget {
  const WrkWidget({
    super.key,
    required this.model,
  });
  final Det model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      width: double.infinity,
      height: 74.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffE2E2E2),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(
            model.image,
            width: 58.w,
            height: 58.h,
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
                  '${model.min}',
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/ic_play.png',
            width: 28.w,
          ),
        ],
      ),
    );
  }
}
