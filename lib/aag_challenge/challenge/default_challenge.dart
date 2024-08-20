import 'package:athlete_go/aag_challenge/challenge/logic/def_challenge_provider.dart';
import 'package:athlete_go/aag_challenge/my/challenge_card_view.dart';
import 'package:athlete_go/aag_testing/widgets/sh_button.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DefaultChallenge extends StatefulWidget {
  const DefaultChallenge({
    super.key,
  });

  @override
  State<DefaultChallenge> createState() => _DefaultChallengeState();
}

class _DefaultChallengeState extends State<DefaultChallenge> {
  var challenge;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: FutureBuilder(
          future: Provider.of<DefChallengeProvider>(context, listen: false)
              .initialize(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snap.hasError) {
              return Center(child: Text('An error occurred!'));
            } else {
              return Consumer<DefChallengeProvider>(
                builder: (context, provider, _) {
                  final defChallenge = provider.defChallenge;
                  challenge = provider.currentChallenge;
                  return Column(
                    children: [
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final item = gridViewData[index];
                          String value = '';

                          switch (index) {
                            case 0:
                              value = defChallenge.level.toString();
                              break;
                            case 1:
                              value = defChallenge.challengeComplete.toString();
                              break;
                            case 2:
                              value = defChallenge.myChallenge.toString();
                              break;
                            case 3:
                              value =
                                  '${defChallenge.kcalBurned.toString()} kcal';
                              break;
                          }

                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            decoration: BoxDecoration(
                              color: item.color,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (item.icon != null)
                                    Image.asset(
                                      item.icon!,
                                      height: 30.h,
                                    ),
                                  Text(
                                    value,
                                    style: AagAppFonts.s20w500.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.title,
                                    style: AagAppFonts.s14w500.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: ChallengeCardView(
                          model: challenge,
                          isChallenge: true,
                        ),
                      ),
                      ShButton(
                        onPressed: () {
                          provider.selectNextChallenge();
                        },
                        title: 'Accept challenge',
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class GridViewData {
  final int value;
  final String title;
  final Color color;
  final String? icon;

  GridViewData({
    required this.value,
    required this.title,
    required this.color,
    this.icon,
  });
}

final List<GridViewData> gridViewData = [
  GridViewData(
    value: 0,
    title: 'Your level',
    color: const Color(0xffEFE2FF),
    icon: 'assets/icons/cup.png',
  ),
  GridViewData(
    value: 0,
    title: 'Chellenge complete',
    color: const Color(0xffA9F6ED),
  ),
  GridViewData(
    value: 0,
    title: 'My chellenge ',
    color: const Color(0xffA9F6CA),
  ),
  GridViewData(
    value: 0,
    title: 'Chellenge complete',
    color: const Color(0xffFEEAC4),
    icon: 'assets/icons/fire.png',
  ),
];
