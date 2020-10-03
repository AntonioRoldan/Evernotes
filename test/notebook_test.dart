import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';

void main() {
  group("construction", () {
    test("Can access the shared single notebook singleton", () {
      expect(Notebook.shared, isNotNull);
    });
  });

  group("removal", () {
    test("remove by index", () {
      final Note n = Note("hola");
      Notebook.shared.add(n);
      expect(() => Notebook.shared.removeAt(0), returnsNormally);

      Notebook.shared.add(n);
      expect(Notebook.shared.removeAt(0), n);
    });
  });

  group("contents", () {
    test("length behaves correctly", () {
      final nb = Notebook();
      final nb2 = Notebook();
      final n = Note("Lorem Ipsum");

      expect(nb.length, 0);

      nb2.add(n);

      expect(nb2.length, 1);

      nb2.remove(n);
      expect(nb2.length, 0);
    });
  });
}
