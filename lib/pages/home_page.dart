import 'package:flutter/material.dart';

import 'package:flutter_locale/routes/route_names.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, settingsPage);
            }),
      ),
      body: Center(
        child: Text(
          'Flutter Locale',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
