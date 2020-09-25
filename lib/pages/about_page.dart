import 'package:flutter/material.dart';

import 'package:flutter_locale/localization/constants.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'about_us'),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              getTranslated(context, 'about'),
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
