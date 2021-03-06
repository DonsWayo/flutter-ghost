import 'package:flutter/material.dart';
import 'package:ghost_admin/Routes.dart';
import 'package:ghost_admin/pages/SubmitBugPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 52),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          _createDrawerItem(
              icon: Icons.note,
              text: 'Posts',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.posts)),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Users',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.users)),
          _createDrawerItem(
              icon: Icons.local_offer,
              text: 'Tags',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.tags)),
          _createDrawerItem(
              icon: Icons.local_offer,
              text: 'Tags',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.settings)),
          _createDrawerItem(
              icon: Icons.remove_circle_outline,
              text: 'Log Out',
              onTap: () => removeData(context)),
          Divider(),
          _createDrawerItem(
              icon: Icons.bug_report,
              text: 'Report an issue',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return SubmitBugPage();
                    },
                    fullscreenDialog: true,
                  ))),
        ],
      ),
    );
  }

  removeData(context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Navigator.pushReplacementNamed(context, Routes.login);
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('res/images/drawer_header_background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
