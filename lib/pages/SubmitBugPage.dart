import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubmitBugPage extends StatefulWidget {
  static const String routeName = '/bugReport';
  SubmitBugPage({Key key}) : super(key: key);

  @override
  _SubmitBugPageState createState() => _SubmitBugPageState();
}

class _SubmitBugPageState extends State<SubmitBugPage> {
  final databaseReference = Firestore.instance;
  final TextEditingController issueController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.teal,
                  tooltip: 'Close',
                  iconSize: 44,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            emailSection(),
            SizedBox(
              height: 25,
            ),
            textViewSection(),
            SizedBox(
              height: 55,
            ),
            buttonSection()
          ],
        ),
      ),
    ));
  }

  void createRecord() {
    databaseReference.collection("bugs").add({
      'userEmail': emailController,
      'platform': 'lol',
      'description': issueController.text
    }).then((response) {
      print(response);
    });
  }

  Container emailSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      child: TextFormField(
        controller: emailController,
        enabled: true,
        decoration: InputDecoration(labelText: "Email to get feeback ;)"),
        scrollPadding: EdgeInsets.all(0.0),
        keyboardType: TextInputType.multiline,
        maxLines: 1,
        autofocus: true,
      ),
    );
  }

  Container textViewSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
      child: TextFormField(
        controller: issueController,
        enabled: true,
        decoration: InputDecoration(labelText: "Issue..."),
        scrollPadding: EdgeInsets.all(0.0),
        keyboardType: TextInputType.multiline,
        maxLines: 8,
        autofocus: true,
      ),
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
          createRecord();
        },
        elevation: 0.0,
        color: Colors.teal,
        child: Text("Send"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
