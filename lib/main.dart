import 'package:athlete_go/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(const MyApp(homeScreen: AagSplashScreen()));
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
              ))),
          home: homeScreen,
        ));
  }
}
