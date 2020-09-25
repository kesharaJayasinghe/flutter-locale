import 'package:flutter/material.dart';

import 'package:flutter_locale/pages/home_page/components/drawer_list.dart';
import 'package:flutter_locale/pages/home_page/components/main_form.dart';

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
        // leading: IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {
        //       Navigator.pushNamed(context, settingsPage);
        //     }),
      ),
      drawer: DrawerList(),
      body: MainForm(),
    );
  }
}
