import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_locale/pages/about_page.dart';
import 'package:flutter_locale/pages/home_page/home_page.dart';
import 'package:flutter_locale/pages/not_found_page.dart';
import 'package:flutter_locale/pages/settings_page.dart';
import 'package:flutter_locale/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (ctx) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (ctx) => AboutPage());
      case settingsPage:
        return MaterialPageRoute(builder: (ctx) => SettingsPage());
    }
    return MaterialPageRoute(builder: (ctx) => NotFoundPage());
  }
}
