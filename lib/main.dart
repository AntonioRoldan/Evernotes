import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

import 'domain/notebook.dart';

final Notebooks notebooksModel = Notebooks.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextResources.appName,
      routes: {
        NotebooksListView.routeName: (context) => NotebooksListView(notebooksModel), 
        NotesListView.routeName: (context) => NotesListView(context),
      },
      initialRoute: NotebooksListView.routeName,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF388E3C),
        accentColor: const Color(0xFFFFC107),
      ),
      home: NotebooksListView(notebooksModel),
      );
  }
}
