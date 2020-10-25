import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:intl/intl.dart';

class NotesListView extends StatefulWidget {
  final Notebook _model;
  final Notebooks notebooks;
  static String routeName = 'NotesList';
  NotesListView(BuildContext context) : _model = (ModalRoute.of(context).settings.arguments as NotesArguments).notebook
  , notebooks = (ModalRoute.of(context).settings.arguments as NotesArguments).notebooks;
  
  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    widget.notebooks.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    widget.notebooks.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._model.title)
      ),
      body: ListView.builder(
        itemCount: widget._model.length,
        itemBuilder: (context, index) {
          return NoteSliver(widget._model, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget._model.add(Note("New note"));
          modelDidChange();
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}

class NoteSliver extends StatefulWidget {
  final Notebook notebook;
  final int index;

  const NoteSliver(Notebook notebook, int index)
      : notebook = notebook,
        index = index;

  @override
  _NoteSliverState createState() => _NoteSliverState();
}

class _NoteSliverState extends State<NoteSliver> {
  @override
  Widget build(BuildContext context) {
    final DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebook.removeAt(widget.index);
        setState(() {});
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Note has been deleted!"),
          ),
        );
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.toc),
          title: Text(widget.notebook[widget.index].body),
          subtitle:
              Text(fmt.format(widget.notebook[widget.index].modificationDate)),
        ),
      ),
    );
  }
}
