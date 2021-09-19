import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'library_controller.dart';

class LibraryPage extends StatefulWidget {
  final String title;
  const LibraryPage({Key key, this.title = "Library"}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends ModularState<LibraryPage, LibraryController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
