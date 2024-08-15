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
  final List<String> tems;

  ShHiveModel({
    required this.title,
    required this.imageUrl,
    required this.totalDays,
    required this.tems,
  });
}
