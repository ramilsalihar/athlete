import 'package:athlete_go/aag_challenge/my/logic/my_hive_model.dart';
import 'package:athlete_go/aag_challenge/my/logic/my_repo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'def_challenge_model.dart';

class DefChallengeProvider extends ChangeNotifier {
  Box<DefChallengeModel> _defChallengeBox =
      Hive.box<DefChallengeModel>('defChallengeBox');
  Box<MyHiveModel> _challengeBox = Hive.box<MyHiveModel>('challenges');
  List<MyHiveModel> challenges = [];
  int myChallenge = 0;

  DefChallengeModel defChallenge = DefChallengeModel(
    level: 1,
    challengeComplete: 0,
    myChallenge: 0,
    kcalBurned: 0,
    currentChallenge: 0,
  );

  int _currentChallengeIndex = 0;

  DefChallengeProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    var temp = await MyRepoImpl().getMy();
    myChallenge = temp.length;
    if (_defChallengeBox.isEmpty) {
      // Storing the initial model
      DefChallengeModel initialModel = DefChallengeModel(
        level: 1,
        challengeComplete: 0,
        myChallenge: myChallenge,
        kcalBurned: 0,
        currentChallenge: 0,
      );

      await _defChallengeBox.add(initialModel);
    } else {
      defChallenge = _defChallengeBox.values.first;
    }

    challenges = _challengeBox.values.toList();
  }

  Future<void> initialize() => _initialize();

  // Get the current challenge
  MyHiveModel get currentChallenge => challenges[_currentChallengeIndex];

  void addChallenge(MyHiveModel challenge) {
    updateModelAfterClick(
      level: defChallenge.level,
      challengeComplete: defChallenge.challengeComplete,
      myChallenge: defChallenge.myChallenge + 1,
      kcalBurned: defChallenge.kcalBurned,
    );
    notifyListeners();
  }

  // Update the model after clicking, with currentChallenge increment
  void updateModelAfterClick({
    required int level,
    required int challengeComplete,
    required int myChallenge,
    required int kcalBurned,
  }) {
    final updatedModel = DefChallengeModel(
      level: level,
      challengeComplete: challengeComplete,
      myChallenge: myChallenge,
      kcalBurned: kcalBurned,
      currentChallenge: (_currentChallengeIndex + 1) % challenges.length,
    );

    _defChallengeBox.putAt(0, updatedModel);
    _currentChallengeIndex = updatedModel.currentChallenge;

    defChallenge = updatedModel;
    notifyListeners();
  }

  // Update the model without changing currentChallenge
  void updateModelWithoutChangingCurrent({
    required int level,
    required int challengeComplete,
    required int myChallenge,
    required int kcalBurned,
  }) {
    final updatedModel = DefChallengeModel(
      level: level,
      challengeComplete: challengeComplete,
      myChallenge: myChallenge,
      kcalBurned: kcalBurned,
      currentChallenge: _currentChallengeIndex,
    );

    _defChallengeBox.putAt(0, updatedModel);
    notifyListeners();
  }

  // Select the next challenge
  void selectNextChallenge() {
    _currentChallengeIndex = (_currentChallengeIndex + 1) % challenges.length;
    updateModelAfterClick(
      level: defChallenge.level + 1,
      challengeComplete: defChallenge.challengeComplete + 1,
      myChallenge: defChallenge.myChallenge,
      kcalBurned:
          defChallenge.kcalBurned + challenges[_currentChallengeIndex].kcal,
    );
  }

  // Reset the challenges
  void resetChallenges() {
    _currentChallengeIndex = 0;
    notifyListeners();
  }
}
