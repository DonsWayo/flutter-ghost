import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:ghost_admin/pages/EditorPage.dart';
import 'package:ghost_admin/pages/HomePage.dart';
import 'package:ghost_admin/pages/LoginPage.dart';
import 'package:ghost_admin/pages/NewTagPage.dart';
import 'package:ghost_admin/pages/PostsPage.dart';
import 'package:ghost_admin/pages/ProfilePage.dart';
import 'package:ghost_admin/pages/SubmitBugPage.dart';
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
      theme: ThemeData.dark(),
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
        Routes.bugReport: (context) => SubmitBugPage(),
        Routes.profile: (context) => ProfilePage(author: null,)
      }
    );
  }
}

 