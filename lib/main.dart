import 'package:etraveladda/screens/getting_started.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GettingStarted());
  }
}
