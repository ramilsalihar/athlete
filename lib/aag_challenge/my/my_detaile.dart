import 'package:athlete_go/aag_challenge/my/logic/my_hive_model.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDetaile extends StatefulWidget {
  const MyDetaile({super.key, required this.model});
  final MyHiveModel model;

  @override
  State<MyDetaile> createState() => _MyDetaileState();
}

class _MyDetaileState extends State<MyDetaile> {
  late Uint8List imageCodeUnitsDetail;
  @override
  void initState() {
    imageCodeUnitsDetail = Uint8List.fromList(widget.model.image.codeUnits);
    super.initState();
  }

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
          'Chellenge details',
          style: AagAppFonts.s20w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 234.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(imageCodeUnitsDetail),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              widget.model.name,
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Image.asset(
                  'assets/images/ic_time.png',
                  width: 16.w,
                ),
                Text(
                  '${widget.model.time} min',
                  style: TextStyle(
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 16.w),
                Image.asset(
                  'assets/images/ic_burn.png',
                  width: 16.w,
                ),
                Text(
                  '${widget.model.kcal} min',
                  style: TextStyle(
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              widget.model.description,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14.h,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
