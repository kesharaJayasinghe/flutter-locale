import 'package:flutter/material.dart';
import 'package:flutter_locale/localization/app_localization.dart';

import 'package:intl/intl.dart';

import 'package:flutter_locale/classes/language.dart';
import 'package:flutter_locale/main.dart';
import 'package:flutter_locale/pages/home_page/components/drawer_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  DateTime _selectedDate;

  void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'si':
        _temp = Locale(language.languageCode, 'LK');
        break;
      case 'hi':
        _temp = Locale(language.languageCode, 'IN');
        break;
      case 'ar':
        _temp = Locale(language.languageCode, 'AE');
        break;
      case 'fr':
        _temp = Locale(language.languageCode, 'FR');
        break;
      default:
        _temp = Locale(language.languageCode, 'US');
    }

    MyApp.setLocale(context, _temp);
  }

  void _showsuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalization.of(context).getTranslatedValue('home_page'),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18),
          child: _mainForm(context),
        ),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            child: Text(
              'Add Information',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildNameFormField(),
          SizedBox(height: 15),
          buildEmailFormField(),
          SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              labelText: _selectedDate == null
                  ? 'Enter date of birth'
                  : (DateFormat.yMd().format(_selectedDate)),
              hintText: 'Select date of birth',
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1940),
                lastDate: DateTime.now(),
                // firstDate: DateTime(DateTime.now().year - 100),
                // lastDate: DateTime(DateTime.now().year + 1),
              ).then((pickedDate) {
                if (pickedDate == null) {
                  return;
                }
                setState(() {
                  _selectedDate = pickedDate;
                });
              });
            },
          ),
          SizedBox(height: 24),
          MaterialButton(
            height: 50,
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              if (_key.currentState.validate()) {
                _showsuccessDialog();
              }
            },
            child: Center(
              child: Text(
                'Proceed',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (val) {
        if (val.isEmpty) {
          return 'Email can\'t be blank';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        labelText: 'E-mail',
        hintText: 'Enter your email',
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      validator: (val) {
        if (val.isEmpty) {
          return 'Name can\'t be blank';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        labelText: 'Name',
        hintText: 'Enter your name',
      ),
    );
  }
}
