import 'dart:async';
import 'package:athlete_go/aag_training/finish.dart';
import 'package:athlete_go/aag_training/widgets/dn.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainStart extends StatefulWidget {
  const TrainStart({super.key, required this.model});
  final TrainDn model;
  @override
  State<TrainStart> createState() => _TrainStartState();
}

class _TrainStartState extends State<TrainStart> {
  final PageController controller = PageController();
  int currantPage = 0;

  Timer timerStart = Timer(Duration.zero, () {});
  late final oneSecStart = const Duration(seconds: 1);
  bool isChekStart = false;

  bool _isRunning = false;
  late int totalSecondsMain;

  @override
  void initState() {
    super.initState();
    startTimerStart();
    totalSecondsMain = widget.model.det[currantPage].min * 60;
    controller.addListener(() {
      if (controller.page?.round() != currantPage) {
        handlePageChange(controller.page!.round());
      }
    });
  }

  @override
  void dispose() {
    timerMain.cancel();
    controller.dispose();
    super.dispose();
  }

  int secondsStart = 0;
  Future<void> startTimerStart() async {
    secondsStart = 1;
    timerStart = Timer.periodic(
      oneSecStart,
      (Timer timer) {
        if (mounted) {
          setState(() {
            secondsStart--;
            if (secondsStart == 0) {
              timer.cancel();
              setState(() {
                isChekStart = true;
              });
              if (!_isRunning) {
                if (mounted) {
                  startTimerMain();
                  setState(() {
                    _isRunning = !_isRunning;
                  });
                }
              }
            }
          });
        }
      },
    );
  }

  String minutesConvert(int seconds) {
    Duration clockTimer = Duration(seconds: seconds);
    return clockTimer.inSeconds.remainder(60).toString().padLeft(
          2,
        );
  }

  Timer timerMain = Timer(Duration.zero, () {});
  late final oneSecMain = const Duration(seconds: 1);
  late int secondMain = totalSecondsMain;
  double progress = 0;

  Future<void> startTimerMain() async {
    if (!_isRunning) {
      secondMain = totalSecondsMain;

      _isRunning = true;

      timerMain = Timer.periodic(
        oneSecMain,
        (Timer timer) {
          if (mounted) {
            setState(() {
              secondMain--;
              progress = (totalSecondsMain - secondMain) / totalSecondsMain;
              if (secondMain <= 0) {
                timer.cancel();
                _isRunning = false;
                isActive = true;
                if (currantPage < widget.model.det.length - 1) {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {}
              }
            });
          }
        },
      );
    }
  }

  String minutesConvertMain(int seconds) {
    Duration clockTimer = Duration(seconds: seconds);
    return '${clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0')}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
  }

  void handlePageChange(int newPageIndex) {
    if (timerMain.isActive) {
      timerMain.cancel();
    }

    setState(() {
      currantPage = newPageIndex;
      totalSecondsMain = widget.model.det[currantPage].min * 60;
      secondMain = totalSecondsMain;
      progress = 0;
      _isRunning = false;
    });

    startTimerMain();
  }

  bool isActive = false;
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
          'Exercise details',
          style: AagAppFonts.s20w700,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  handlePageChange(value);
                });
              },
              controller: controller,
              children: List.generate(widget.model.det.length, (index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        child: Image.asset(widget.model.det[index].image),
                      ),
                      Center(
                        child: Text(
                          minutesConvertMain(secondMain),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 32.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.r),
                        decoration: const BoxDecoration(
                          color: AagAppColors.blueBg,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.det[index].title,
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ic_time.png',
                                  width: 16.w,
                                ),
                                Text(
                                  ' ${widget.model.det[index].min} min',
                                  style: TextStyle(
                                    fontSize: 16.h,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              '1. Starting position:',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.model.det[index].starting,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.h,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              '2. Execution:',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.model.det[index].execution,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.h,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              '3. Repetitions:',
                              style: TextStyle(
                                fontSize: 16.h,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              widget.model.det[index].repetitions,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.h,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            InkWell(
                              onTap: () async {
                                if (currantPage ==
                                    widget.model.det.length - 1) {
                                  timerMain.cancel();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FinishPage(
                                        model: widget.model,
                                      ),
                                    ),
                                  );

                                  ///
                                } else {
                                  controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 52.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AagAppColors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    currantPage == widget.model.det.length - 1
                                        ? 'Finish'
                                        : 'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.h,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 32.h),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
