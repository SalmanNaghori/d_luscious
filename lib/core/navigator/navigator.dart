import 'package:d_luscious/features/home/widget/grid_view.dart';
import 'package:flutter/cupertino.dart';

class GlobalVariable {
  // This global key is used in material app for navigation through firebase notifications.
  // [navState] usage can be found in [notification_notifier.dart] file.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final BuildContext appContext = navigatorKey.currentContext!;
}

GlobalKey<GridViewWidgetState> gridViewKey = GlobalKey<GridViewWidgetState>();
