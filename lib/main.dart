import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'features/d_luscious.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  orientations();
  configLoading();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: false),
    home: const MyApp(),
  ));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..indicatorColor = ConstColor.primaryColor
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorSize = 60
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = false
    ..maskColor = Colors.black54
    ..textColor = Colors.transparent
    ..boxShadow = <BoxShadow>[]
    ..userInteractions = false;
}

void orientations() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedSplashScreen(
//         splash: Column(children: [
//           Lottie.asset('assets/splash.json', width: 500, height: 500),
//           const Padding(
//             padding: EdgeInsets.all(6.0),
//           ),
//           const Text(
//             "Welcome to D'luscious",
//             style: TextStyle(
//                 fontFamily: 'Chewy', fontSize: 40, color: Color(0xffF5A342)),
//           ),
//         ]),
//         nextScreen: Home(),
//         duration: 2000,
//         splashTransition: SplashTransition.fadeTransition,
//         pageTransitionType: PageTransitionType.fade,
//         splashIconSize: 600,
//         animationDuration: const Duration(seconds: 3),
//       ),
//     );
//   }
// }
