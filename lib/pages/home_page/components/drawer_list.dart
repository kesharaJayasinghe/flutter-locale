import 'package:flutter/material.dart';

import 'package:flutter_locale/localization/constants.dart';
import 'package:flutter_locale/routes/route_names.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: Colors.white60,
      ),
      title: Text(
        title,
        style: _textStyle,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30,
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/user.png'),
                    ),
                  ),
                ),
                Text(
                  getTranslated(context, 'name'),
                  style: _textStyle,
                ),
              ],
            ),
            SizedBox(height: 20),
            buildListTile(getTranslated(context, 'about_us'), Icons.info, () {
              Navigator.popAndPushNamed(context, aboutRoute);
            }),
            buildListTile(getTranslated(context, 'settings'), Icons.settings,
                () {
              Navigator.popAndPushNamed(context, settingsPage);
            })
          ],
        ),
      ),
    );
  }
}
