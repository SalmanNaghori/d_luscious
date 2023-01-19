import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:d_luscious/Authenticate/LoginScreen.dart';
import 'package:d_luscious/Screen/HomeScreen.dart';
import 'package:d_luscious/Splash_screen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        splash: Column(children: [
          Lottie.asset('assets/splash.json', width: 500, height: 500),
          const Padding(
            padding: EdgeInsets.all(6.0),
          ),
          const Text(
            "Welcome to D'luscious",
            style: TextStyle(
                fontFamily: 'Chewy', fontSize: 40, color: Color(0xffF5A342)),
          ),
        ]),
        nextScreen: Home(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        splashIconSize: 600,
        animationDuration: const Duration(seconds: 3),
      ),
    );
  }
}
