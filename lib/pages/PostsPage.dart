import 'package:flutter/material.dart';
import 'package:ghost_admin/components/AppDrawer.dart';
import 'package:ghost_admin/core/Api.dart';
import 'package:ghost_admin/core/models.dart';

class PostsPage extends StatefulWidget {
  static const String routeName = '/posts';
  PostsPage({Key key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  bool _isLoading = true;
  var posts = new Posts();

  getPosts() async {
    Map<String, String> headers = {'Origin': 'https://deviffy.com'};
    Api.getAllRequest('posts/?source=html&formats=html', headers).then((response) async {
      //if (response) {
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
            child: Icon(Icons.navigation)));
  }

  _getBody() {
    if(posts != null && posts.posts.length != null) {
      return ListView.builder(
          itemCount: posts.posts.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(posts.posts[index].title));
          },
        );
    } else {
      return Container();
    }
  }
}
