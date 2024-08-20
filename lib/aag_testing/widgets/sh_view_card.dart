import 'package:athlete_go/aag_testing/logic/sh_hive_model.dart';
import 'package:athlete_go/aag_testing/logic/sh_provider.dart';
import 'package:athlete_go/aag_testing/widgets/sh_button.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShViewCard extends StatefulWidget {
  const ShViewCard({
    super.key,
    required this.data,
    this.isSport = true,
  });

  final ShHiveModel data;
  final bool isSport;

  @override
  State<ShViewCard> createState() => _ShViewCardState();
}

class _ShViewCardState extends State<ShViewCard> {
  int daysCovered = 0;
  Map<String, bool> times = {};
  bool isSelected = false;

  @override
  initState() {
    super.initState();
    daysCovered =
        widget.data.times.values.where((element) => element == true).length;

    times = widget.data.times;
  }

  // Function to determine if the day is today
  bool _isToday(String day) {
    int todayIndex = DateTime.now().weekday % 7;
    int dayIndex = days.indexOf(day);
    return dayIndex == todayIndex;
  }

  String _getTodayIndex() {
    return days[DateTime.now().weekday % 7];
  }

  // List of days to maintain order
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  // Function to update today's day to blue with a checkbox
  void end() {
    setState(() {
      String today = days[DateTime.now().weekday % 7];
      times[today] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  widget.data.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.title,
                      style: AagAppFonts.s16w400.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                    ),
                    Text(
                      '$daysCovered/${widget.data.totalDays} days',
                      style: AagAppFonts.s14w500.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: days.map((day) {
              isSelected = times[day] ?? false;
              bool isToday = _isToday(day);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          isToday || isSelected ? Colors.blue : Colors.grey,
                      radius: 17.r,
                      child: isSelected
                          ? Image.asset(
                              'assets/icons/check.png',
                              width: 15.w,
                            )
                          : null,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      day,
                      style: TextStyle(
                        color:
                            isToday || isSelected ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          ShButton(
            onPressed: () {
              print('IsSelected: $isSelected');
              if (!isSelected) {
                showCongratulationsDialog(context);
                setState(() {
                  widget.data.times[_getTodayIndex()] = true;
                  widget.isSport
                      ? Provider.of<ShProvider>(context, listen: false)
                          .updateSports(widget.data)
                      : Provider.of<ShProvider>(context, listen: false)
                          .updateHealth(widget.data);
                });
              }
            },
            title: 'End the day ${daysCovered + 1}',
          )
        ],
      ),
    );
  }
}

void showCongratulationsDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.4,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/congrats.png',
                  height: 100,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Congratulations, you have completed the challenge! You move on to the next day",
                  style: AagAppFonts.s16w400.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
