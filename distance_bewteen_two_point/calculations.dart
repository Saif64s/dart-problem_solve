import 'dart:math';

import 'convert.dart';
import 'point.dart';

class Calculations {
  static double calculateDistance(Point point1, Point point2) {
    final lat1 = Convert.degreesToRadians(point1.latitude);
    final lon1 = Convert.degreesToRadians(point1.longitude);
    final lat2 = Convert.degreesToRadians(point2.latitude);
    final lon2 = Convert.degreesToRadians(point2.longitude);

    final dLat = lat2 - lat1;
    final dLon = lon2 - lon1;

    final a =
        pow(sin(dLat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    const double earthRadiusKm = 6371.0;
    return earthRadiusKm * c;
  }
}
