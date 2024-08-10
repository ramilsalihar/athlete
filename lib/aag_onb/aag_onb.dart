import 'package:athlete_go/aag_onb/aag_onb_pages/aag_onb_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AagOnb extends StatefulWidget {
  const AagOnb({super.key});

  @override
  State<AagOnb> createState() => _AagOnbState();
}

class _AagOnbState extends State<AagOnb> {
  late PageController _onbPageController;
  bool isLastPage = false;
  @override
  void initState() {
    _onbPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _onbPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.72,
              child: PageView(
                controller: _onbPageController,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 1);
                },
                children: const [
                  AagOnbPageWidget(
                      image: 'assets/images/onb1.png',
                      title: 'Welcome to Yoga Beginner\'s Guide',
                      subTitle:
                          'Taking Your First Steps: What to Expect in Your Yoga Journey'),
                  AagOnbPageWidget(
                      image: 'assets/images/onb2.png',
                      title: 'Master Your Practice: Guided Yoga Sessions ',
                      subTitle:
                          'Explore Exercises, Tracking, Tips, and More in Our Yoga App Onboarding'),
                ],
              ),
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
