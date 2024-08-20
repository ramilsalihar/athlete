import 'package:athlete_go/aag_challenge/my/challenge_card_view.dart';
import 'package:athlete_go/aag_challenge/my/logic/my_hive_model.dart';
import 'package:athlete_go/aag_challenge/my/logic/my_repo.dart';
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
            itemBuilder: (context, index) => ChallengeCardView(
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
