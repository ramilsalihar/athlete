import 'package:athlete_go/aag_testing/logic/sh_hive_model.dart';
import 'package:athlete_go/aag_testing/logic/sh_provider.dart';
import 'package:athlete_go/aag_testing/widgets/sh_button.dart';
import 'package:athlete_go/aag_testing/widgets/sh_text_field.dart';
import 'package:athlete_go/aag_testing/widgets/sh_weight_statistics_card.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShWeightScreen extends StatefulWidget {
  const ShWeightScreen({super.key});

  @override
  State<ShWeightScreen> createState() => _ShWeightScreenState();
}

final List<String> days = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];

class _ShWeightScreenState extends State<ShWeightScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final TextEditingController weightCont = TextEditingController();
    final TextEditingController dateCont = TextEditingController();

    String getWeekDay() {
      return days[DateTime.now().weekday - 1 % 7];
    }

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Sport and Health',
          style: AagAppFonts.s20w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Consumer<ShProvider>(
          builder: (ctx, provider, _) {
            WeightModel weight = provider.getWeight();
            return Column(
              children: [
                ShWeightStatisticsCard(weights: weight.stats),
                const SizedBox(height: 16),
                ShTextField(
                  title: 'New weight',
                  controller: weightCont,
                ),
                const SizedBox(height: 16),
                ShTextField(
                  title: 'Date added',
                  controller: dateCont,
                  isDate: true,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // print('Cancel');
                        // print(getWeekDay());
                      },
                      title: 'Cancel',
                      width: width * 0.4,
                      isOutlined: true,
                    ),
                    ShButton(
                      onPressed: () {
                        weight.stats[getWeekDay()] =
                            int.tryParse(weightCont.text) ?? 0;
                        var newWeight = WeightModel(
                          stats: weight.stats,
                          weight: double.parse(weightCont.text),
                          dateAdded: DateFormat('dd.MM.yyyy').format(
                            DateTime.now(),
                          ),
                        );
                        provider.updateWeight(
                          newWeight,
                        );
                        Navigator.of(context).pop();
                      },
                      title: 'Save',
                      width: width * 0.4,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
