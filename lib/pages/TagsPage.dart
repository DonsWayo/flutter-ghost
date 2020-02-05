import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_admin/pages/NewTagPage.dart';

import '../components/AppDrawer.dart';
import '../core/Api.dart';
import '../core/models.dart';


class TagsPage extends StatefulWidget {
  static const String routeName = '/tags';
  TagsPage({Key key}) : super(key: key);

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {

  bool _isLoading = false;
  var tags = Tags();


  getTags() async {
    Api.getAllRequest('tags/?limit=all&include=count.posts').then((response) async {
      print(response);
      setState(() {
        _isLoading = false;
        setState(() {
          tags = tagsFromJson(response);
        });
      });
    });
  }

   @override
  void initState() {
    super.initState();
    getTags();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tags")),
        drawer: AppDrawer(),
        body: _getBody(),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
             await Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true, builder: (context) => NewTagPage()));
              setState(() {
                getTags();
              });
            },
            child: Icon(Icons.add))
    );
  }

  _getBody() {
    if (tags != null && tags.tags != null) {
      return ListView.builder(
        itemCount: tags.tags.length,
        itemBuilder: (context, index) {
          Tag _model = tags.tags[index];
          return ListTile(
            title: Row(
              children: <Widget>[
                Text(_model.name.toString()),
                SizedBox(
                  width: 16.0,
                ),
              ],
            ),
            subtitle: Text(_model.slug.toString()),
           /*  trailing: Icon(
              Icons.arrow_forward_ios,
              size: 14.0,
            ),
            onTap: () {
             // Navigator.push(
              //  context,
              //  MaterialPageRoute(
                 // builder: (context) => ProfilePage(author: users.users[index]),
             //   ),
              //);
            }, */
          );
        },
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}