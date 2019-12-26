import 'package:flutter/material.dart';

import '../core/models.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  final User author;
  ProfilePage({Key key, @required this.author}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(author);
}

class _ProfilePageState extends State<ProfilePage> {
  User author;
  _ProfilePageState(this.author);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[SizedBox(height: 20), profileImage()],
          ),
        ));
  }



  childForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Email",
              ),
            ),
          ],
        ));
  }

  profileImage() {
    return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.0,
        child: ClipOval(
            child: Image.network(
          author.profileImage,
          fit: BoxFit.cover,
          width: 120.0,
          height: 120.0,
        )));
  }
}
