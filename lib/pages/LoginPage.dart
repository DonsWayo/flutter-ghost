import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghost_admin/core/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
    static const String routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.amber, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return Scaffold(
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

  login(String email, pass) async {
    Map<String, String> body = {
      'username': email,
      'password': pass
    };

    Map<String, String> headers = {
      'Origin': 'https://deviffy.com'
    };

    Api.postLoginRequest('session',headers, body).then((response) async {
      if (response) {
        setState(() {
          _isLoading = false;
        });
       // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        //sharedPreferences.setString("token", jsonResponse['data.token.access_token']);
       // sharedPreferences.setString("email", email);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route<dynamic> route) => false);
      }
     else {
      setState(() {
        _isLoading = false;
      });
      _showDialog();
      print(response.body);
    }
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
          });
          login(emailController.text, passwordController.text);
        },
        elevation: 0.0,
        color: Colors.amber,
        child: Text("Sign In"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }


  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: "Email",
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration:
                InputDecoration(icon: Icon(Icons.lock), hintText: "Password"),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Login",
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
    );
  }
}
