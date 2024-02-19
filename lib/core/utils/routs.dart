import 'package:d_luscious/features/Screen/category_screen_tab.dart';
import 'package:d_luscious/features/favorite/favorite_screen_tab.dart';
import 'package:flutter/cupertino.dart';

import '../../features/dash_board/dash_board.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case LOGIN_ROUTE:
      //   return CupertinoPageRoute(builder: (_) => LoginScreen());

      case DASHBOARD_1:
        return CupertinoPageRoute(builder: (_) => const DashboardScreen());

      case FAVORITESCREEN:
        return CupertinoPageRoute(builder: (_) => const FavoriteScreenTab());

      case CATEGORYSCREEN:
        return CupertinoPageRoute(builder: (_) => const CategoryScreenTab());

      // case No_INTERNET_ROUTE:
      //   return CupertinoPageRoute(builder: (_) => NoInterNetScreen());

      default:
        return CupertinoPageRoute(builder: (_) => const DashboardScreen());
    }
  }
}

//routes
const String HOME_SCREEN = '/HomeScreen';
const String FAVORITESCREEN = '/FavoriteScreen';
const String CATEGORYSCREEN = '/CategoryScreen';
const String SIGNUP_ROUTE = '/SignUpScreen';
const String LOGIN_ROUTE = '/LoginScreen';
const String DASHBOARD_1 = '/Dashboard1';
const String SIGNUP_STEP1 = '/SignUp1';
const String DASHBOARD_2 = '/Dashboard2';
const String No_INTERNET_ROUTE = '/NoInternetScreen';
