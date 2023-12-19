
import 'package:flutter/material.dart';

import '../model/menu_item.dart';

class MenuItems {
  static const List<MenuItemabc> itemsFirst = [
    itemSettings,
    itemShare,
  ];
  static const List<MenuItemabc> itemsSecond = [itemSignOut];
  static const itemSettings = MenuItemabc(
    text: 'Settings',
    icon: Icons.settings,
  );

  static const itemShare = MenuItemabc(
    text: 'Share',
    icon: Icons.share,
  );
  static const itemSignOut = MenuItemabc(
    text: 'Log Out',
    icon: Icons.logout,
  );
}
