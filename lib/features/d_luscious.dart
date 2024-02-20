import 'dart:developer';

import 'package:d_luscious/bloc/internet_check_cubit/internet_cubit.dart';
import 'package:d_luscious/core/constant/app_string.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/navigator/navigator.dart';
import 'package:d_luscious/features/Authenticate/login_screen.dart';
import 'package:d_luscious/features/dash_board/dash_board.dart';
import 'package:d_luscious/features/dash_board/dash_board_cubit.dart';
import 'package:d_luscious/features/no_internet/no_internet_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../core/utils/routs.dart';

class MyApp extends StatefulWidget {
  static Logger logger = Logger();
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, widget) {
        return MultiProvider(
          providers: [
            BlocProvider(create: (context) => DashboardCubit()),
            BlocProvider(create: (context) => InternetConnectionCubit()),
          ],
          child: BlocBuilder<InternetConnectionCubit, NetworkState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: MaterialApp(
                  //debugShowMaterialGrid: true,
                  //showSemanticsDebugger: true,
                  supportedLocales: const [
                    Locale("en"),

                    /// THIS IS FOR COUNTRY CODE PICKER
                  ],
                  localizationsDelegates: const [
                    // CountryLocalizations.delegate,

                    /// THIS IS FOR COUNTRY CODE PICKER
                  ],
                  builder: EasyLoading.init(
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaler: const TextScaler.linear(1.0)),
                        child: child!,
                      );
                    },
                  ),

                  theme: ThemeData(
                    colorScheme: ThemeData().colorScheme.copyWith(
                          primary: ConstColor.primaryColor,
                        ),
                    useMaterial3: false,
                    primaryColor: ConstColor.primaryColor,
                    appBarTheme: const AppBarTheme(
                      elevation: 0.0,
                      color: Colors.transparent,
                      systemOverlayStyle: SystemUiOverlayStyle.dark,
                      centerTitle: true,
                    ),
                    // scaffoldBackgroundColor: Colors.white,
                  ),

                  navigatorKey: GlobalVariable.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  title: AppString.appName,
                  onGenerateRoute: Routers.generateRoute,
                  routes: const <String, WidgetBuilder>{},
                  // home: AppLifecycleReactor(),
                  home: getRootWidget(state),
                  //  home: LoginScreen (),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget getRootWidget(NetworkState connectionState) {
    log("User logged in==${FirebaseAuth.instance.currentUser != null}");
    if (connectionState == NetworkState.connected) {
      return FirebaseAuth.instance.currentUser != null
          ? const DashboardScreen()
          : const LoginScreen();
    } else {
      return const NoInternetScreen();
    }
  }
}
