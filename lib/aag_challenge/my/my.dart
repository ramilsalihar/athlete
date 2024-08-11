import 'package:athlete_go/aag_challenge/my/logic/my_hive_model.dart';
import 'package:athlete_go/aag_challenge/my/logic/my_repo.dart';
import 'package:athlete_go/aag_challenge/my/my_detaile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyChellange extends StatefulWidget {
  const MyChellange({
    super.key,
  });

  @override
  State<MyChellange> createState() => _MyChellangeState();
}

class _MyChellangeState extends State<MyChellange> {
  List<MyHiveModel> listMy = [];
  bool loadaRemsam = false;

  @override
  void initState() {
    super.initState();
    getList();
  }

  getList() async {
    setState(() {
      loadaRemsam = true;
    });

    listMy.clear();

    final repoList = await MyRepoImpl().getMy();
    setState(() {
      listMy = repoList.reversed.toList();
      loadaRemsam = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return listMy.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shrinkWrap: true,
            itemCount: listMy.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) => MyWidget(
              model: listMy[index],
            ),
          )
        : Column(
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

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.model});
  final MyHiveModel model;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
            builder: (context) => MyDetaile(model: widget.model),
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
    );
  }
}
