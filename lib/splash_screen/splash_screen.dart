import 'package:athlete_go/core/aag_btm.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AagSplashScreen extends StatefulWidget {
  const AagSplashScreen({super.key});

  @override
  State<AagSplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<AagSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWelcome();
  }

  Future _navigateToWelcome() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final showHome = prefs.getBool('showHome') ?? false;
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (_) => AagDownBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Image.asset(
            'assets/icons/icon.png',
            width: 372,
            height: 383,
          ),
        ),
      ),
    );
  }
}
