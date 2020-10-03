import 'package:flutter_test/flutter_test.dart';
import 'package:everpobre/extensions/date_time.dart';

void main() {
  test("almost equal", () {
    final d = DateTime.now();
    final d1 = DateTime.now();
    final d2 = DateTime.utc(1998, 11, 12);

    expect(d.almostEqual(d1), isTrue);
    expect(d1.almostEqual(d), isTrue);
    expect(d2.almostEqual(d1), isFalse);
  });
}
