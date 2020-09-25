import 'package:flutter/material.dart';

import 'package:flutter_locale/classes/language.dart';
import 'package:flutter_locale/localization/constants.dart';
import 'package:flutter_locale/main.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'settings'),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: DropdownButton<Language>(
              iconSize: 24,
              hint: Text(getTranslated(context, 'change_language')),
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            e.flag,
                            style: TextStyle(fontSize: 24),
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
    );
  }
}
