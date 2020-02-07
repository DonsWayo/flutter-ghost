
import 'package:ghost_admin/pages/EditorPage.dart';
import 'package:ghost_admin/pages/HomePage.dart';
import 'package:ghost_admin/pages/LoginPage.dart';
import 'package:ghost_admin/pages/NewTagPage.dart';
import 'package:ghost_admin/pages/PostsPage.dart';
import 'package:ghost_admin/pages/ProfilePage.dart';
import 'package:ghost_admin/pages/SettingsPage.dart';
import 'package:ghost_admin/pages/SubmitBugPage.dart';
import 'package:ghost_admin/pages/TagsPage.dart';
import 'package:ghost_admin/pages/UsersPage.dart';

class Routes {
  static const String home = HomePage.routeName;
  static const String posts = PostsPage.routeName;
  static const String login = LoginPage.routeName;
  static const String editor = EditorPage.routeName;
  static const String users = UsersPage.routeName;
  static const String profile = ProfilePage.routeName;
  static const String tags = TagsPage.routeName;
  static const String newTag = NewTagPage.routeName;
  static const String bugReport = SubmitBugPage.routeName;
  static const String settings = SettingsPage.routeName;

}