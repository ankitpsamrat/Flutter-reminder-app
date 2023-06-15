import 'package:desktop_application/helpers/navigation.dart';
import 'package:flutter/widgets.dart';

class AppUI {
  static double dh =
      MediaQuery.of(NavigationService.navigatorKey.currentContext!)
              .size
              .height /
          100;

  static double dw =
      MediaQuery.of(NavigationService.navigatorKey.currentContext!).size.width /
          100;
}
