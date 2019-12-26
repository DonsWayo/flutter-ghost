import 'package:flutter/material.dart';
import 'package:ghost_admin/components/AppDrawer.dart';
import 'package:ghost_admin/components/CircleWidget.dart';
import 'package:ghost_admin/core/Api.dart';
import 'package:ghost_admin/core/models.dart';

import '../core/models.dart';
import 'EditorPage.dart';

class PostsPage extends StatefulWidget {
  static const String routeName = '/posts';
  PostsPage({Key key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  bool _isLoading = true;
  var posts = Posts();

  getPosts() async {
    Api.getAllRequest('posts/?source=html&formats=html')
        .then((response) async {
      //if (response) {
      print(response);
      setState(() {
        _isLoading = false;
        posts = postsFromJson(response);
      });
      //   } else {
      //    setState(() {
      //       _isLoading = false;
      //     });
      //_showDialog();
      //print(response.body);
      //  }
    });
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Posts")),
        drawer: AppDrawer(),
        body: _getBody(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editor');
            },
            child: Icon(Icons.add)));
  }
  

  _getBody() {
    if (posts != null && posts.posts != null) {
      return ListView.builder(
        itemCount: posts.posts.length,
        itemBuilder: (context, index) {
          Post _model = posts.posts[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 24.0,
              backgroundImage: NetworkImage(_model.authors[0].profileImage),
            ),
            title: Row(
              children: <Widget>[
                Text(_model.title),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  _model.status,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            subtitle: Text(_model.slug),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 14.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditorPage(post: posts.posts[index]),
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
