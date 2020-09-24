import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
      ),
      body: Center(
        child: Text(
          'Page Not Found',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
