import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample/auth/sign_up.dart';
import 'package:sample/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  void _startTimer(StatefulWidget nextPage) {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        _second--;
      });
      if (_second == 0) {
        _cancelSplashTimer();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => nextPage),
            (Route<dynamic> route) => false);
      }
    });
  }

  void _cancelSplashTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  Future<bool> _getOnboarding() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    bool onBoarding = _pref.getBool('onBoarding') ?? true;
    return onBoarding;
  }

  @override
  void initState() {
    StatefulWidget nextPage = const SignUpPage();
    _getOnboarding().then((val) {
      if (val == false) {
        nextPage = const SignUpPage();
      }

      if (_second != 0) {
        _startTimer(nextPage);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _cancelSplashTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
