import 'package:athlete_go/aag_training/home_page.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AagTraining extends StatefulWidget {
  const AagTraining({super.key});

  @override
  State<AagTraining> createState() => _AagTrainingState();
}

class _AagTrainingState extends State<AagTraining> {
  // bool page = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Workout',
          style: AagAppFonts.s20w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.all(4.r),
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: AagAppColors.blueBg,
            //     borderRadius: BorderRadius.circular(16),
            //   ),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: InkWell(
            //           onTap: () {
            //             setState(() {
            //               page = true;
            //             });
            //           },
            //           child: Container(
            //             height: 50.h,
            //             width: double.infinity,
            //             decoration: BoxDecoration(
            //               color: page == true
            //                   ? AagAppColors.blue
            //                   : AagAppColors.blueBg,
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //             child: Center(
            //               child: Text(
            //                 'Home',
            //                 style: TextStyle(
            //                   fontSize: 16.h,
            //                   fontWeight: FontWeight.w700,
            //                   color: page == true ? Colors.white : Colors.black,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: InkWell(
            //           onTap: () {
            //             setState(() {
            //               page = false;
            //             });
            //           },
            //           child: Container(
            //             height: 50.h,
            //             width: double.infinity,
            //             decoration: BoxDecoration(
            //               color: page == false
            //                   ? AagAppColors.blue
            //                   : AagAppColors.blueBg,
            //               borderRadius: BorderRadius.circular(16),
            //             ),
            //             child: Center(
            //               child: Text(
            //                 'Gym',
            //                 style: TextStyle(
            //                   fontSize: 16.h,
            //                   fontWeight: FontWeight.w700,
            //                   color:
            //                       page == false ? Colors.white : Colors.black,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 8.h),
            // page == true
            //     ?
            const Expanded(
              child: HomePage(),
            )
            // : const SizedBox()
          ],
        ),
      ),
    );
  }
}
