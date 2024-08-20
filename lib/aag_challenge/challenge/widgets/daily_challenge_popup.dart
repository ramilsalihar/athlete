import 'dart:ui';

import 'package:athlete_go/aag_challenge/challenge/logic/def_challenge_provider.dart';
import 'package:athlete_go/aag_challenge/my/challenge_card_view.dart';
import 'package:athlete_go/aag_testing/widgets/sh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DailyChallengePopUp extends StatelessWidget {
  const DailyChallengePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0), // Adjust the sigma value to increase/decrease blur
        child: Container(
          color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
        ),
      ),
      Dialog(
        backgroundColor: Colors.transparent,
        child: FutureBuilder(
          future: Provider.of<DefChallengeProvider>(context, listen: false)
              .initialize(),
          builder: (ctx, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Consumer<DefChallengeProvider>(
              builder: (ctx, prov, _) {
                var challenge = prov.currentChallenge;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios_outlined,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 40),
                        const Text(
                          'Daily Challenge',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100.h),
                    ChallengeCardView(
                      model: challenge,
                      isWhite: true,
                      isChallenge: true,
                    ),
                    SizedBox(height: 60.h),
                    ShButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        prov.selectNextChallenge();
                      },
                      title: 'Accept challenge',
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    ]);
  }
}
