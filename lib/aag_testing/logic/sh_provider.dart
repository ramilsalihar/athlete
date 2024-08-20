import 'package:athlete_go/aag_testing/logic/sh_data.dart';
import 'package:athlete_go/aag_testing/logic/sh_hive_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class ShProvider with ChangeNotifier {
  var sportsBox = Hive.box<ShHiveModel>('sportsBox');
  var healthBox = Hive.box<ShHiveModel>('healthBox');
  var weightBox = Hive.box<WeightModel>('weightBox');
  List<ShHiveModel> sports = [];
  List<ShHiveModel> health = [];
  var currWeight = WeightModel(
    weight: 0.0,
    dateAdded: DateFormat('dd.MM.yyyy').format(DateTime.now()).toString(),
    stats: {
      'Mon': 0,
      'Tue': 0,
      'Wed': 0,
      'Thu': 0,
      'Fri': 0,
      'Sat': 0,
      'Sun': 0,
    },
  );

  ShProvider() {
    initialize();
  }

  void initialize() async {
    if (sportsBox.isEmpty && healthBox.isEmpty) {
      for (var item in sportList) {
        await sportsBox.add(item);
      }

      for (var item in healthList) {
        await healthBox.add(item);
      }
    }

    sports = sportsBox.values.toList();
    health = healthBox.values.toList();

    if (weightBox.isEmpty) {
      await weightBox.add(
        WeightModel(
          weight: 0.0,
          dateAdded: DateFormat('dd.MM.yyyy').format(DateTime.now()).toString(),
          stats: {
            'Mon': 0,
            'Tue': 0,
            'Wed': 0,
            'Thu': 0,
            'Fri': 0,
            'Sat': 0,
            'Sun': 0,
          },
        ),
      );
    } else {
      currWeight = weightBox.getAt(0)!;
    }

    notifyListeners();
  }

  List<ShHiveModel> getSports() => sports;

  List<ShHiveModel> getHealth() => health;

  WeightModel getWeight() => currWeight;

  void updateSports(ShHiveModel data) {
    sportsBox.putAt(data.key, data);
    sports = sportsBox.values.toList();
    notifyListeners();
  }

  void updateHealth(ShHiveModel data) {
    healthBox.putAt(data.key, data);
    health = healthBox.values.toList();
    notifyListeners();
  }

  void updateWeight(WeightModel data) {
    weightBox.putAt(0, data);
    notifyListeners();
  }
}
