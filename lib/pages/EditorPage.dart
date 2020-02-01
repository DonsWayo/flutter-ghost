import 'dart:convert';
import 'package:ghost_admin/pages/WebViewPage.dart';
import 'package:markdown/markdown.dart' as Mark;
import 'package:notus/convert.dart';
import 'package:flutter/material.dart';
import 'package:ghost_admin/core/Api.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';
import 'package:html2md/html2md.dart' as html2md;

import '../core/models.dart';

enum WhyFarther { draft, publish }
enum ConfirmAction { CANCEL, ACCEPT }

class EditorPage extends StatefulWidget {
  static const String routeName = '/editor';
  final Post post;

  EditorPage({Key key, this.post}) : super(key: key);

  @override
  EditorPageState createState() => EditorPageState(post);
}

class EditorPageState extends State<EditorPage> {
  Post post;
  EditorPageState(this.post);

  /// Allows to control the editor and the document.
  ZefyrController _controller;
  var _selection;
  var _postName;
  var _postContent;
  var _savedType;
  var _postTitle = 'New Post';

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    if (this.post != null && this.post.title != null) {
      _postTitle = this.post.title;
    }
    // Here we must load the document and pass it to Zefyr controller.
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // Note that the editor requires special `ZefyrScaffold` widget to be
    // one of its parents.
    return Scaffold(
      appBar: AppBar(
        title: Text(_postTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.remove_red_eye),
            tooltip: 'Show preview',
            onPressed: () {
              _savedType = "draft";
              showWebView();
            },
          ),
          PopupMenuButton<WhyFarther>(
            onSelected: (WhyFarther result) {
              setState(() {
                _selection = result;
                print(result);
                switch (result) {
                  case WhyFarther.publish:
                    // _savedType = "published";
                    _savedType = "published";
                    prepareForSave();
                    break;
                  case WhyFarther.draft:
                    _savedType = "draft";
                    prepareForSave();
                    break;
                  default:
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.draft,
                child: Text('Save as draft'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.publish,
                child: Text('publish'),
              ),
            ],
          )
        ],
      ),
      body: ZefyrScaffold(
        child: ZefyrEditor(
          padding: EdgeInsets.all(16),
          controller: _controller,
          focusNode: _focusNode,
        ),
      ),
    );
  }

  convertHtml2md() {
    var html = this.post.html;
    return html2md.convert(html);
  }

  prepareForSave() {
    if (this.post != null && this.post.title != null ) {
      _saveNotes();
    } else {
      _showPublishDialog();
    }
  }

  /// Loads the document to be edited in Zefyr.
  NotusDocument _loadDocument() {
    // For simplicity we hardcode a simple document with one line of text
    // saying "Zefyr Quick Start".
    // (Note that delta must always end with newline.)
    //  final Delta delta = Delta()..insert("Zefyr Quick Start\n");
    Delta delta;
    if (this.post != null) {
      delta = Delta()..insert(convertHtml2md() + '\n');
    } else {
      delta = Delta()..insert("Writte your post...\n");
    }
    return NotusDocument.fromDelta(delta);
  }

  _saveNotes() {
    Delta _delta = _controller.document.toDelta();
    String html = Mark.markdownToHtml(notusMarkdown.encode(_delta).toString());
    _postContent = html;
    print(html);
    
    if (post.id != null) {
      makePost();
    } else {
      updatePost();
    }
    // save the markdown string
  }

  makePost() {
    Map<dynamic, dynamic> body = {
      "posts": [
        {"title": this.post.title, "html": _postContent, "status": _savedType}
      ]
    };
    print(post);

    Api.postAllRequest('posts/?source=html', body)
        .then((response) async {
      print(response);
    });
  }

  updatePost() {
    Map<dynamic, dynamic> body = {
      "posts": [
        {"title": this.post.title, "html": _postContent, "status": _savedType, "updated_at": DateTime.now().toIso8601String()}
      ]
    };
    print(post);

    Api.postAllRequest('posts/' + post.id +'/?source=html', body)
        .then((response) async {
      print(response);
    });
  }

  showWebView() {
     if (this.post != null && this.post.title != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => WebViewPage(
              title: this.post.title,
              selectedUrl: this.post.url,
            )));
    } else {
      _showPublishDialog();
    }
    
  }

  _showPublishDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Save Post"),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Post title', hintText: 'eg. The best post...'),
                onChanged: (value) {
                  _postName = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Save"),
              onPressed: () {
                Navigator.of(context).pop();
                _saveNotes();
              },
            ),
          ],
        );
      },
    );
  }
}
