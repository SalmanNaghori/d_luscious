import 'package:d_luscious/core/constant/colors_const.dart';
import 'package:d_luscious/features/dash_board/dash_board_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constant/app_string.dart';
import '../../core/widgets/appbard.dart';
import '../Screen/category_screen_tab.dart';
import '../favorite/favorite.dart';
import '../home/home_screen_tab.dart';
import '../Screen/search_screen_tab.dart';
import '../Screen/user_profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardCubit cubit = DashboardCubit();

  static final List<Widget> _pageNavigation = <Widget>[
    const HomeScreenTab(),
    const FavoriteScreenTab(),
    const SearchScreenTab(),
    const CategoryScreenTab(),
    const UserProfileScreenTab(),

    // const ProfileTabScreen(),
  ];

  @override
  void initState() {
    context.read<DashboardCubit>().updateIndex(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, int>(builder: (ctx, state) {
      return Scaffold(
        appBar: CustomAppBar.blankAppBar(
          title: "",
        ),
        body: tabScreenView(state),
        bottomNavigationBar: _bottomNavigationBar(state),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }

  void _getChangeBottomNav(int index) {
    if (index != 6) {
      context.read<DashboardCubit>().updateIndex(index);
    }
  }

  Widget tabScreenView(int index) {
    return _pageNavigation.elementAt(index);
  }

  Widget _bottomNavigationBar(int index) {
    return BottomNavigationBar(
      elevation: 15,
      type: BottomNavigationBarType.fixed,
      // unselectedItemColor: ColorConst.unSelectedTabColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      // backgroundColor: ColorConst.whiteColor,
      currentIndex: context.read<DashboardCubit>().state,
      // selectedItemColor: ColorConst.primaryColor,
      unselectedFontSize: 10,
      selectedFontSize: 10,
      onTap: _getChangeBottomNav,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: AppString.home,
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart_fill),
          label: AppString.favorite,
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
          label: AppString.search,
          backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
          label: AppString.category,
          backgroundColor: Colors.pink,
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          label: AppString.profile,
          backgroundColor: Colors.pink,
        ),
      ],
      selectedItemColor: ConstColor.primaryColor,
    );
  }

  //goto qr screen
  // Future<void> _gotoQRScannerScreen() async {
  //   requestCameraPermission().then((value) {
  //     print("permission call");
  //     if (value) {
  //       navigateWithMaterialToPage(const QRScannerScreen());
  //     }
  //   });
  // }
}
