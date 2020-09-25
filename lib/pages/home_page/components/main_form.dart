import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:flutter_locale/localization/constants.dart';

class MainForm extends StatefulWidget {
  MainForm({Key key}) : super(key: key);

  @override
  _MainFormState createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String username;
  String email;
  DateTime _selectedDate;

  void _openTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                child: Text(
                  getTranslated(context, 'add_information'),
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
                      ? getTranslated(context, 'date_of_birth')
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
                    _openTimePicker();
                  }
                },
                child: Center(
                  child: Text(
                    getTranslated(context, 'proceed'),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (val) {
        if (val.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        labelText: getTranslated(context, 'email'),
        hintText: getTranslated(context, 'email_hint'),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      validator: (val) {
        if (val.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        labelText: getTranslated(context, 'name'),
        hintText: getTranslated(context, 'name_hint'),
      ),
    );
  }
}
