import 'package:hive/hive.dart';

part 'sh_hive_model.g.dart';

@HiveType(typeId: 0)
class ShHiveModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final int totalDays;

  @HiveField(3)
  final Map<String, bool> times;

  ShHiveModel({
    required this.title,
    required this.imageUrl,
    required this.totalDays,
    required this.times,
  });
}

@HiveType(typeId: 3)
class WeightModel extends HiveObject {
  @HiveField(0)
  final double weight;
  @HiveField(1)
  final String dateAdded;
  @HiveField(2)
  final Map<String, int> stats;

  WeightModel({
    required this.weight,
    required this.dateAdded,
    required this.stats,
  });
}
