import 'dart:convert';
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

  /// Zefyr editor like any other input field requires a focus node.
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
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
        title: Text("Editor page"),
        actions: <Widget>[
          PopupMenuButton<WhyFarther>(
            onSelected: (WhyFarther result) {
              setState(() {
                _selection = result;
                print(result);
                switch (result) {
                  case WhyFarther.publish:
                    // _savedType = "published";
                    _savedType = "draft";
                    _showPublishDialog();
                    break;
                  case WhyFarther.draft:
                    _savedType = "draft";
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
    makePost();
    // save the markdown string
  }

  makePost() {
    Map<dynamic, dynamic> body = {
      "posts": [
        {"title": _postName, "html": _postContent, "status": _savedType}
      ]
    };

    Api.postAllRequest('posts/?source=html', body)
        .then((response) async {
      print(response);
    });
  }

  _showPublishDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Publish"),
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
              child: Text("Publish"),
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
