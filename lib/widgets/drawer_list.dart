import 'package:flutter/material.dart';

import 'package:flutter_locale/routes/route_names.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
  );

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
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
                  'User Name',
                  style: _textStyle,
                ),
              ],
            ),
            // DrawerHeader(
            //     padding: EdgeInsets.only(bottom: 14.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       // mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Container(
            //           width: 150.0,
            //           height: 150.0,
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             image: DecorationImage(
            //               fit: BoxFit.fill,
            //               image: AssetImage('assets/images/user.png'),
            //             ),
            //           ),
            //         ),
            //       ],
            //     )),
            SizedBox(height: 20),
            buildListTile('About', Icons.info, () {
              Navigator.popAndPushNamed(context, aboutRoute);
            }),
            buildListTile('Settings', Icons.settings, () {
              Navigator.popAndPushNamed(context, settingsPage);
            })
          ],
        ),
      ),
    );
  }
}

// Container _drawerList(BuildContext context) {
//   TextStyle _textStyle = TextStyle(
//     color: Colors.white,
//     fontSize: 24,
//   );
//   return Container(
//     color: Theme.of(context).primaryColor,
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         DrawerHeader(
//           child: Container(
//             height: 100,
//             child: CircleAvatar(),
//           ),
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.info,
//             color: Colors.white,
//             size: 30,
//           ),
//           title: Text(
//             'About',
//             style: _textStyle,
//           ),
//           onTap: () {
//             Navigator.popAndPushNamed(context, aboutRoute);
//           },
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.settings,
//             color: Colors.white,
//             size: 30,
//           ),
//           title: Text(
//             'Settings',
//             style: _textStyle,
//           ),
//           onTap: () {
//             Navigator.popAndPushNamed(context, settingsPage);
//           },
//         ),
//       ],
//     ),
//   );
// }
