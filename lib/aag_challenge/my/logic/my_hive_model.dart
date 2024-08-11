import 'package:hive_flutter/hive_flutter.dart';

part 'my_hive_model.g.dart';

@HiveType(typeId: 1)
class MyHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String image;
  @HiveField(2)
  String name;
  @HiveField(3)
  int time;
  @HiveField(4)
  int kcal;
  @HiveField(5)
  String description;

  MyHiveModel({
    required this.id,
    required this.image,
    required this.name,
    required this.time,
    required this.kcal,
    required this.description,
  });
}
