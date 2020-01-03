import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:ghost_admin/pages/EditorPage.dart';
import 'package:ghost_admin/pages/HomePage.dart';
import 'package:ghost_admin/pages/LoginPage.dart';
import 'package:ghost_admin/pages/NewTagPage.dart';
import 'package:ghost_admin/pages/PostsPage.dart';
import 'package:ghost_admin/pages/ProfilePage.dart';
import 'package:ghost_admin/pages/TagsPage.dart';
import 'package:ghost_admin/pages/UsersPage.dart';

import 'Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //FirebaseAnalytics analytics = FirebaseAnalytics();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghost CMS',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      //home: HomePage(),
       routes:  {
        '/': (context) => LoginPage(),
        Routes.home: (context) => HomePage(),
        Routes.posts: (context) => PostsPage(),
        Routes.login: (context) => LoginPage(),
        Routes.editor: (context) => EditorPage(),
        Routes.users: (context) => UsersPage(),
        Routes.tags: (context) => TagsPage(),
        Routes.newTag: (context) => NewTagPage(),
        Routes.profile: (context) => ProfilePage(author: null,)
      }
    );
  }
}

 