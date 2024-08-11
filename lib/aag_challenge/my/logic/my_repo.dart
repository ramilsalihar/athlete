import 'package:athlete_go/aag_challenge/my/logic/my_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class MyRepo {
  Future<List<MyHiveModel>> getMy();
  Future<void> setMy(MyHiveModel myHiveModel);
}

class MyRepoImpl implements MyRepo {
  @override
  Future<List<MyHiveModel>> getMy() async {
    final myList = await Hive.openBox<MyHiveModel>('MyList');
    return myList.values.toList();
  }

  @override
  Future<void> setMy(MyHiveModel myHiveModel) async {
    final myList = await Hive.openBox<MyHiveModel>('MyList');
    await myList.add(myHiveModel);
  }
}
