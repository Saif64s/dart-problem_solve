import 'dart:math';

import 'coordinate.dart';

class CoordinateCalculator {
  double calculateDistance(Coordinate start, Coordinate end) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((end.latitude - start.latitude) * p) / 2 +
        cos(start.latitude * p) *
            cos(end.latitude * p) *
            (1 - cos((end.longitude - start.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  List<Coordinate> filterCoordinatesByRange(
      List<Coordinate> coordinates, Coordinate referencePoint, double range) {
    return coordinates
        .where((coordinate) =>
            calculateDistance(referencePoint, coordinate) <= range)
        .toList();
  }
}
