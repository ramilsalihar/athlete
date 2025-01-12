import 'package:athlete_go/aag_challenge/challenge/default_challenge.dart';
import 'package:athlete_go/aag_challenge/challenge/widgets/daily_challenge_popup.dart';
import 'package:athlete_go/aag_challenge/my/add_my.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my/my.dart';

class AagChallenge extends StatefulWidget {
  const AagChallenge({super.key});

  @override
  State<AagChallenge> createState() => _AagChallengeState();
}

class _AagChallengeState extends State<AagChallenge> {
  bool _isPopupChecked = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Ensure the popup is only checked once after the widget is first built
    if (!_isPopupChecked) {
      _checkForDailyPopup();
      _isPopupChecked = true;
    }
  }

  Future<void> _checkForDailyPopup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastShownDate = prefs.getString('last_popup_date');
    String today = DateTime.now().toIso8601String().substring(0, 10);

    if (lastShownDate != today) {
      await _showDailyPopup();
      await prefs.setString('last_popup_date', today);
    }
  }

  Future<void> _showDailyPopup() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return DailyChallengePopUp();
      },
    );
  }

  bool page = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Challenge',
          style: AagAppFonts.s20w700,
        ),
        actions: [
          page == true
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddMy(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      color: AagAppColors.blue,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(4.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AagAppColors.blueBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          page = true;
                        });
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: page == true
                              ? AagAppColors.blue
                              : AagAppColors.blueBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'My challenge',
                            style: TextStyle(
                              fontSize: 16.h,
                              fontWeight: FontWeight.w700,
                              color: page == true ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          page = false;
                        });
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: page == false
                              ? AagAppColors.blue
                              : AagAppColors.blueBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Chellenge',
                            style: TextStyle(
                              fontSize: 16.h,
                              fontWeight: FontWeight.w700,
                              color:
                                  page == false ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            page == true
                ? const Expanded(child: MyChellange())
                : const Expanded(child: DefaultChallenge())
          ],
        ),
      ),
    );
  }
}
