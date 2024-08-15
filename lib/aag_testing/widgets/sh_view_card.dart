import 'package:athlete_go/aag_testing/widgets/sh_button.dart';
import 'package:flutter/material.dart';

class ShViewCard extends StatelessWidget {
  const ShViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          _header(),
          // _days(),
          ShButton(onPressed: () {}, title: 'End the day')
        ],
      ),
    );
  }
}

Widget _header() {
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/images/s1.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      Column(
        children: [
          Text('Today', style: TextStyle(fontSize: 24)),
          Text('Monday', style: TextStyle(fontSize: 16)),
        ],
      ),
    ],
  );
}
