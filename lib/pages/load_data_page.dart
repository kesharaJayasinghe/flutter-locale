import 'package:flutter/material.dart';

import 'package:flutter_locale/localization/langEn/langEn_model.dart';
import 'package:flutter_locale/localization/langEn/langEn_service.dart';

class LoadDataPage extends StatefulWidget {
  @override
  _LoadDataPageState createState() => _LoadDataPageState();
}

class _LoadDataPageState extends State<LoadDataPage> {
  final LangServices services = LangServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Load JSON Data')),
      body: FutureBuilder(
        future: services.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          List<LangEn> _data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 30),
                      child: Text(_data[index].homePage,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 30),
                      child: Text(_data[index].addInformation,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 30),
                      child: Text(_data[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 30),
                      child: Text(_data[index].nameHint,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 30),
                      child: Text(_data[index].email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 30),
                      child: Text(_data[index].emailHint,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                );
                // return ListTile(
                //   title: Text(index.toString()),
                //   subtitle: Text(_data[index].homePage),
                // );
              },
            );
          } else {
            children = <Widget>[
              SizedBox(
                  child: CircularProgressIndicator(), width: 60, height: 60),
              const Padding(
                  padding: EdgeInsets.only(top: 16), child: Text('Loading...'))
            ];
          }
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children));
        },
      ),
    );
  }
}
