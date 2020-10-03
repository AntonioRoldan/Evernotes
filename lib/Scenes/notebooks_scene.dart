import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/domain/notebooks.dart';

class Message {
  final String content;

  Message(String newValue) : content = newValue;
}


class NotebooksListView extends StatefulWidget {
  static const routeName = '/NotebooksList';
  final Notebooks _model;

  const NotebooksListView(Notebooks model) : _model = model;
    
  @override
  _NotebooksListViewState createState() => _NotebooksListViewState();
}

class _NotebooksListViewState extends State<NotebooksListView> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index) {
        return NotebookSliver(widget._model, index);
      },
      
    );
  }
}

class NotebookSliver extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const NotebookSliver(Notebooks notebook, int index)
      : notebooks = notebook,
        index = index;

  @override
  _NotebookSliverState createState() => _NotebookSliverState();
}

class _NotebookSliverState extends State<NotebookSliver> {
  @override
  Widget build(BuildContext context) {

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);

        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Notebook has been deleted!"),
          ),
        );
        setState(() {});
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.toc),
          title: Text(widget.notebooks[widget.index].title),
          subtitle:
              Text(widget.notebooks[widget.index].toString()),
          onTap: () { 
            Navigator.pushNamed(context, NotesListView.routeName, arguments: 
              widget.notebooks[widget.index]
            );
          }
        ),
      ),
    );
  }
}




