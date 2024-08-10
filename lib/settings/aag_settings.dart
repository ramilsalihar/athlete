import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:url_launcher/url_launcher.dart';

class AagSettings extends StatefulWidget {
  const AagSettings({super.key});

  @override
  State<AagSettings> createState() => _AagSettingsState();
}

class _AagSettingsState extends State<AagSettings> {
  void cdOntapSetting(BuildContext context, String cdUriElement) async {
    final Uri cdUri = Uri.parse(cdUriElement);
    if (!await launchUrl(cdUri)) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(cdUriElement),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 5.0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: AagAppFonts.s20w500,
        ),
        titleSpacing: 16.w,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            // _premiumWidget(
            //   onTap: () {
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (_) => const AagPremium()));
            //   },
            // ),
            SizedBox(
              height: 16.h,
            ),
            _SettingsItemWidget(
              onTap: () {
                cdOntapSetting(context, '');
              },
              title: 'Privacy Policy',
            ),
            SizedBox(
              height: 16.h,
            ),
            _SettingsItemWidget(
              onTap: () {
                cdOntapSetting(context, '');
              },
              title: 'Terms of Use',
            ),
            SizedBox(
              height: 16.h,
            ),
            _SettingsItemWidget(
              onTap: () {
                cdOntapSetting(context, '');
              },
              title: 'Share',
            ),
            SizedBox(
              height: 16.h,
            ),
            _SettingsItemWidget(
              onTap: () {
                cdOntapSetting(context, '');
              },
              title: 'Support',
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsItemWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  const _SettingsItemWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withAlpha(15),
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: const Offset(0, 3))
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AagAppFonts.s16w500,
              ),
              // Image.asset(
              //   'assets/icons/circle_arrow_right.png',
              //   width: 28.w,
              //   height: 28.h,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _premiumWidget extends StatelessWidget {
  final Function onTap;
  const _premiumWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 190.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withAlpha(15),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: const Offset(0, 3))
              ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Go premium',
                            style: AagAppFonts.s28w500,
                          ),
                          Image.asset(
                            'assets/icons/star.png',
                            height: 33.h,
                            width: 33.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                              color: AagAppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/auto_donate.png',
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            'Get an auto donation feature',
                            style: AagAppFonts.s16w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                              color: AagAppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/tags.png',
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            'Add tags',
                            style: AagAppFonts.s16w500,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 60.h,
                    width: 137.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 5,
                        color: Colors.black.withAlpha(7),
                      ),
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Just for ',
                              style: AagAppFonts.s16w500
                                  .copyWith(color: Colors.black),
                            ),
                            TextSpan(
                              text: '\$0,99',
                              style: AagAppFonts.s16w500
                                  .copyWith(color: AagAppColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
