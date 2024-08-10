import 'package:flutter/material.dart';

class AagOnbPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const AagOnbPageWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(image),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              subTitle,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
