import 'package:athlete_go/aag_training/widgets/dn.dart';
import 'package:athlete_go/core/aag_btm.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({super.key, required this.model});
  final TrainDn model;

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  int kcal = 0;
  int wrk = 0;

  @override
  void initState() {
    getWr();
    super.initState();
  }

  Future<void> getWr() async {
    int trWk = await getKcal();
    int trWk2 = await getWrk();

    setState(() {
      kcal = trWk;
      wrk = trWk2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Image.asset(widget.model.image),
            SizedBox(height: 16.h),
            Text(
              'Workout Finish',
              style: TextStyle(
                fontSize: 32.h,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Workout details',
              style: TextStyle(
                fontSize: 20.h,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
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
                      '${widget.model.min} min',
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
                      '${widget.model.kcal} kcal',
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
            SizedBox(height: 28.h),
            InkWell(
              onTap: () {
                Navigator.pop(context);
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
                    'Repeat',
                    style: TextStyle(
                      fontSize: 22.h,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            InkWell(
              onTap: () async {
                await setKcal(kcal + widget.model.kcal);
                if (wrk < 3) {
                  await setWrk(wrk + 1);
                }

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AagDownBar(),
                    ),
                    (route) => false);
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
                    'Next',
                    style: TextStyle(
                      fontSize: 22.h,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
