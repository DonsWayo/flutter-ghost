import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ghost_admin/core/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  final storage = new FlutterSecureStorage();
  final TextEditingController websiteController = new TextEditingController(text: 'https://');
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.amber, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return Scaffold(
      body: Center(
        child: Container(
        constraints: BoxConstraints(maxWidth: 400),
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
      )
    );
  }

  login(String email, pass, website) async {

    var web = website;

    Map<String, String> body = {'username': email, 'password': pass};

    Map<String, String> headers = {'Origin': web};

    Api.postLoginRequest('session', headers, body, web).then((response) async {
      if (response) {
        setState(() {
          _isLoading = false;
        });
        navigateToHome();
      } else {
        setState(() {
          _isLoading = false;
        });
        _showDialog();
        //print(response.body);
      }
    });
  }

  navigateToHome() {
    saveUser();
    Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route<dynamic> route) => false);
  }


  getRemember() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('remember')) {
      navigateToHome();
    } 
  }

   @override
  void initState() {
    super.initState();
    initUser();
    getRemember();
  }

  dispose() {
    super.dispose();
  }

  initUser() async {
    Map<String, String> allValues = await storage.readAll();
    if (allValues.isNotEmpty) {
      print(allValues);
    }

    _signInAnonymously();
  }

  Future<void> _signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  saveUser() async {
    storage.write(key: "email", value: emailController.text);
    storage.write(key: "password", value: passwordController.text);
  }

  _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Something is wrong"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
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
          login(emailController.text, passwordController.text, websiteController.text);
        },
        elevation: 0.0,
        color: Colors.teal,
        child: Text("Sign In"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: websiteController,
            decoration: InputDecoration(
                icon: Icon(Icons.web_asset),
                hintText: "Website",
                ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: "Admin Email",
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
        margin: EdgeInsets.only(top: 25.0),
        padding: EdgeInsets.all(0),
        child: Image.asset('assets/ghost-logo.png') ,height: 200,);
  }
}
