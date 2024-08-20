import 'package:athlete_go/aag_challenge/my/logic/my_hive_model.dart';
import 'package:athlete_go/aag_challenge/my/my_detaile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChallengeCardView extends StatefulWidget {
  const ChallengeCardView({
    super.key,
    required this.model,
    this.isChallenge = false,
    this.isWhite = false,
  });
  final MyHiveModel model;
  final bool isChallenge;
  final bool isWhite;

  @override
  State<ChallengeCardView> createState() => _ChallengeCardViewState();
}

class _ChallengeCardViewState extends State<ChallengeCardView> {
  late Uint8List imageCodeUnitsDetail;
  @override
  void initState() {
    imageCodeUnitsDetail = Uint8List.fromList(widget.model.image.codeUnits);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyDetaile(
              model: widget.model,
              isFromChallenge: widget.isChallenge,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.isChallenge
                    ? Image.asset(widget.model.image).image
                    : MemoryImage(imageCodeUnitsDetail),
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
              color: widget.isWhite ? Colors.white : Colors.black,
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
                  color: widget.isWhite ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 16.w),
              Image.asset(
                'assets/images/ic_burn.png',
                width: 16.w,
              ),
              Text(
                '${widget.model.kcal} kcal',
                style: TextStyle(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                  color: widget.isWhite ? Colors.white : Colors.black,
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
              color: widget.isWhite ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
