import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

class Notebook with ChangeNotifier {

  final List<Note> _notes = [];

  String _title = '';

  int get length => _notes.length;

  String get title => _title;

  // Constructores
  Notebook(String title) : _title = title;

  Notebook.testDataBuilder(String title) : _title = title {
    _notes.addAll(List.generate(100, (index) => Note("Item $index")));
  }

  // Accesores
  Note operator [](int index) {
    return _notes[index];
  }

  // Mutadores
  bool remove(Note note) {
    final n = _notes.remove(note);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    final Note n = _notes.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  // Object Protocol
  @override
  String toString() {
    return "$runtimeType: $length notes";
  }
}
