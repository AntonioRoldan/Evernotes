/*
Cualquier extension a DateTime
*/

extension Equality on DateTime {
  bool almostEqual(DateTime other, {double precisionInSeconds = 1}) {
    final Duration diff = difference(other);
    final secs = diff.inSeconds.abs();
    return secs <= precisionInSeconds;
  }
}
