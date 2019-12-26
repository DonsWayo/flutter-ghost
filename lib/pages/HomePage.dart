
import 'package:flutter/material.dart';
import 'package:ghost_admin/components/AppDrawer.dart';




class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: AppDrawer(),
    );
  }
}