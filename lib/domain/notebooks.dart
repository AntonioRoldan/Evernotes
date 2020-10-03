import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';

class Notebooks with ChangeNotifier {
  static final shared = Notebooks();

  final List<Notebook> _notebooks = [];

  List<Notebook> get notebooks => _notebooks;

  int get length => _notebooks.length;

  Notebooks();

  Notebooks.testDataBuilder() {
    _notebooks.addAll(List.generate(100, (index) => Notebook.testDataBuilder('Notebook $index')));
  }
  // Accesores
  Notebook operator [](int index) {
    return _notebooks[index];
  }

  // Mutadores
  bool remove(Notebook noteBook) {
    final n = _notebooks.remove(noteBook);
    notifyListeners();
    return n;
  }

  Notebook removeAt(int index) {
    final Notebook n = _notebooks.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Notebook notebook) {
    _notebooks.insert(0, notebook);
    notifyListeners();
  }

  @override
  String toString() {
    return "<$runtimeType: $length notebooks>";
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    } else {
      return other is Notebooks &&
          (other.notebooks == notebooks);
    }
  }

}