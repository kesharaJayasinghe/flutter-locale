import 'package:flutter/material.dart';

import 'package:flutter_locale/routes/custom_router.dart';
import 'package:flutter_locale/routes/route_names.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Locale',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
    );
  }
}
