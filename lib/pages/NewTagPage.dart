import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghost_admin/core/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewTagPage extends StatefulWidget {
  static const String routeName = '/new-tag';
  @override
  _NewTagPageState createState() => _NewTagPageState();
}

class _NewTagPageState extends State<NewTagPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // Remove any elevation to avoid seeing a shadow underneath the translucent material of the app bar.
        elevation: 0.0,
        iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          )
      ),
      body: Container(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  headerSection(),
                  textSection(),
                  buttonSection()
                ],
              ),
      ),
    );
  }

  makePost() {
    Map<dynamic, dynamic> body = {
      "tags": [
        {"name": nameController.text, "slug": slugController.text, "description": descriptionController.text}
      ]
    };

    Api.postAllRequest('tags', body)
        .then((response) async {
        print(response);
        setState(() {
            _isLoading = false;
          });
    });
  }

  _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error Login"),
          content: new Text("Revisa los campos"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
            makePost();
          });
        },
        elevation: 0.0,
        color: Colors.green,
        child: Text("Save"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController slugController = new TextEditingController();
  final TextEditingController descriptionController =
      new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              icon: Icon(Icons.title),
              hintText: "Name",
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: slugController,
            obscureText: false,
            decoration: InputDecoration(
                icon: Icon(Icons.text_fields), hintText: "Slug"),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            controller: descriptionController,
            obscureText: false,
            decoration: InputDecoration(
                icon: Icon(Icons.comment), hintText: "Description"),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("New Tag",
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
    );
  }
}
