import 'package:athlete_go/aag_training/widgets/dn.dart';
import 'package:athlete_go/aag_training/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.r),
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffFEEAC4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Calories burned',
                          style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          'assets/images/ic_burn.png',
                          width: 23.w,
                        )
                      ],
                    ),
                    SizedBox(height: 12.h),
                    kcal <= 2290
                        ? SizedBox(
                            height: 120.h,
                            child: CircularPercentIndicator(
                              radius: 60,
                              lineWidth: 18.0,
                              animation: true,
                              percent: (kcal * 100 / 2290) / 100,
                              center: Text(
                                "${kcal}kl",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: const Color(0xffFFA800),
                              backgroundColor: Colors.white,
                              reverse: true,
                            ),
                          )
                        : SizedBox(
                            height: 120.h,
                            child: CircularPercentIndicator(
                              radius: 60,
                              lineWidth: 18.0,
                              animation: true,
                              percent: 1,
                              center: Text(
                                "${kcal}kl",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: const Color(0xffFFA800),
                              backgroundColor: Colors.white,
                              reverse: true,
                            ),
                          )
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.r),
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffEFE2FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'This is the week ',
                          style: TextStyle(
                            fontSize: 14.h,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          'assets/images/calendarIcon.png',
                          width: 24.w,
                        )
                      ],
                    ),
                    SizedBox(height: 36.h),
                    Text(
                      '$wrk/3',
                      style: TextStyle(
                        fontSize: 32.h,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Workouts',
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
          ],
        ),
        SizedBox(height: 4.h),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shrinkWrap: true,
            itemCount: listWork.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) => HomeWidget(
              model: listWork[index],
            ),
          ),
        ),
      ],
    );
  }
}
