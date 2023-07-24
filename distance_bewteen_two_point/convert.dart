import 'dart:io';

import 'calculations.dart';
import 'point.dart';

class DistanceCalculatorApp {
  void run() {
    Point point1 = _getUserCoordinates(
        "Enter the latitude and longitude of Point 1 (e.g., 40.7128 -74.0060):");
    Point point2 = _getUserCoordinates(
        "Enter the latitude and longitude of Point 2 (e.g., 34.0522 -118.2437):");

    DistanceCalculator distanceCalculator = DistanceCalculator();

    final startTime = DateTime.now();
    double distance = distanceCalculator.calculateDistance(point1, point2);
    final endTime = DateTime.now();

    print(
        "The distance between the two points is approximately ${distance.toStringAsFixed(2)} kilometers.");
    print(
        "Runtime: ${endTime.difference(startTime).inMicroseconds} microseconds");
  }

  Point _getUserCoordinates(String prompt) {
    print(prompt);
    String input = stdin.readLineSync()!;
    List<String> latLng = input.split(' ');
    double latitude = double.parse(latLng[0]);
    double longitude = double.parse(latLng[1]);
    return Point(latitude, longitude);
  }
}
