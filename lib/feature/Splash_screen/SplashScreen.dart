//
//
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Timer(
//     //     Duration(seconds: 3),
//     //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//     //         builder: (BuildContext context) => HomeScreen())));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedSplashScreen(
//         splash: Column(children: [
//           Lottie.asset('assets/splash.json', width: 500, height: 500),
//           // const Text(
//           // //   "D'luscious",
//           // //   style: TextStyle(
//           // //       fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
//           // // ),
//           const Padding(
//             padding: EdgeInsets.all(6.0),
//           ),
//           const Text(
//             "Welcome to D'luscious",
//             style: TextStyle(
//                 fontFamily: 'Chewy', fontSize: 40, color: Color(0xffF5A342)),
//           ),
//         ]),
//         // nextScreen: Home(),
//         duration: 4000,
//         splashTransition: SplashTransition.fadeTransition,
//         // pageTransitionType: PageTransitionType.fade,
//         splashIconSize: 600,
//         animationDuration: const Duration(seconds: 2),
//       ),
//     );
//   }
// }
