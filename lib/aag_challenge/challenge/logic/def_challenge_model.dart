import 'package:hive/hive.dart';

part 'def_challenge_model.g.dart';

@HiveType(typeId: 2)
class DefChallengeModel extends HiveObject {
  @HiveField(0)
  final int level;

  @HiveField(1)
  final int challengeComplete;

  @HiveField(2)
  final int myChallenge;

  @HiveField(3)
  final int kcalBurned;

  @HiveField(4)
  final int currentChallenge;

  DefChallengeModel({
    required this.level,
    required this.challengeComplete,
    required this.myChallenge,
    required this.kcalBurned,
    required this.currentChallenge,
  });
}
