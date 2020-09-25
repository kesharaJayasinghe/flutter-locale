import 'package:flutter/material.dart';

import 'package:flutter_locale/localization/constants.dart';
import 'package:flutter_locale/pages/home_page/components/main_form.dart';
import 'package:flutter_locale/classes/language.dart';
import 'package:flutter_locale/main.dart';
import 'package:flutter_locale/pages/home_page/components/drawer_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);

    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'home_page'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            e.flag,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(width: 15),
                          Text(e.name),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      drawer: DrawerList(),
      body: MainForm(),
    );
  }
}
