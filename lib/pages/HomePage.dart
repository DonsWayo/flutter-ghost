import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:ghost_admin/components/AppDrawer.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WebController webController;
  bool _loading = false;
  String loadUrl;

  @override
  void initState() async { 
    super.initState();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('HeaderKey')) {
      loadUrl = sharedPreferences.getString('HeaderKey');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    FlutterNativeWeb flutterWebView = new FlutterNativeWeb(
      onWebCreated: onWebCreated,
      gestureRecognizers: 
       <Factory<OneSequenceGestureRecognizer>>[
        Factory<OneSequenceGestureRecognizer>(
          () => TapGestureRecognizer(),
        ),
      ].toSet(),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: AppDrawer(),
      body: Container(
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : Column(
          children: <Widget>[
            Container(
              child: flutterWebView,
              height: height,
              width: width,
            ),
          ],
        )
      ),
    );
  }



  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadUrl(loadUrl);
    this.webController.onPageStarted.listen((url) => print("Loading $url"));
    this
        .webController
        .onPageFinished
        .listen((url) => print('perra'));
  }
}
