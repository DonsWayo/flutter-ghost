import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghost_admin/pages/ProfilePage.dart';

import '../components/AppDrawer.dart';
import '../core/Api.dart';
import '../core/models.dart';
import '../core/models.dart';
import '../core/models.dart';
import '../core/models.dart';
import '../core/models.dart';

class UsersPage extends StatefulWidget {
  static const String routeName = '/users';
  UsersPage({Key key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  bool _isLoading = false;
  var users = Users();

  getPosts() async {
    Api.getAllRequest('users').then((response) async {
      print(response);
      setState(() {
        _isLoading = false;
        setState(() {
          users = usersFromJson(response);
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        drawer: AppDrawer(),
        body: _getBody());
  }

  _getBody() {
    if (users != null && users.users != null) {
      return ListView.builder(
        itemCount: users.users.length,
        itemBuilder: (context, index) {
          User _model = users.users[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 24.0,
              backgroundImage: NetworkImage(_model.profileImage),
            ),
            title: Row(
              children: <Widget>[
                Text(_model.name),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  _model.slug,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            subtitle: Text(_model.bio),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 14.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(author: users.users[index]),
                ),
              );
            },
          );
        },
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
