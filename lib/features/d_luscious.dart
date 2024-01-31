import 'dart:developer';

import 'package:d_luscious/core/constant/app_string.dart';
import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/core/navigator/navigator.dart';
import 'package:d_luscious/core/storage/shared_pref_utils.dart';
import 'package:d_luscious/features/Authenticate/login_screen.dart';
import 'package:d_luscious/features/dash_board/dash_board.dart';
import 'package:d_luscious/features/dash_board/dash_board_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../core/utils/routs.dart';

class MyApp extends StatefulWidget {
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
          ],
          child: GestureDetector(
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
              home: getRootWidget(),
              //  home: LoginScreen (),
            ),
          ),
        );
      },
    );
  }

  Widget getRootWidget() {
    log(SharedPrefUtils.getIsUserLoggedIn().toString());
    return SharedPrefUtils.getIsUserLoggedIn()
        ? const DashboardScreen()
        : const LoginScreen();
  }
}
