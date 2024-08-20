import 'package:athlete_go/aag_challenge/challenge/logic/def_challenge_list.dart';
import 'package:athlete_go/aag_challenge/challenge/logic/def_challenge_model.dart';
import 'package:athlete_go/aag_challenge/challenge/logic/def_challenge_provider.dart';
import 'package:athlete_go/aag_challenge/my/logic/my_hive_model.dart';
import 'package:athlete_go/aag_testing/logic/sh_hive_model.dart';
import 'package:athlete_go/aag_testing/logic/sh_provider.dart';
import 'package:athlete_go/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MyHiveModelAdapter());
  Hive.registerAdapter(ShHiveModelAdapter());
  Hive.registerAdapter(DefChallengeModelAdapter());
  Hive.registerAdapter(WeightModelAdapter());

  var box = await Hive.openBox<MyHiveModel>('challenges');
  await Hive.openBox<DefChallengeModel>('defChallengeBox');
  await Hive.openBox<ShHiveModel>('sportsBox');
  await Hive.openBox<ShHiveModel>('healthBox');
  await Hive.openBox<WeightModel>('weightBox');

  if (box.isEmpty) {
    await box.addAll([...defChallengesList]);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DefChallengeProvider()),
        ChangeNotifierProvider(create: (context) => ShProvider()),
      ],
      child: const MyApp(
        homeScreen: AagSplashScreen(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.homeScreen});
  final Widget homeScreen;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your-little-fans-Fd',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'SFProDisplay',
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            cupertinoOverrideTheme: const CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                pickerTextStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 23,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          home: homeScreen,
        ));
  }
}
