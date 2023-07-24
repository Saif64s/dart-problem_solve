import 'dart:io';

import 'calculations.dart';
import 'point.dart';

void main() {
  print(
      "Enter the latitude and longitude of Point 1 (e.g., 40.7128 -74.0060):");
  String input1 = stdin.readLineSync()!;
  List<String> latLng1 = input1.split(' ');

  print(
      "Enter the latitude and longitude of Point 2 (e.g., 34.0522 -118.2437):");
  String input2 = stdin.readLineSync()!;
  List<String> latLng2 = input2.split(' ');

  double latitude1 = double.parse(latLng1[0]);
  double longitude1 = double.parse(latLng1[1]);
  double latitude2 = double.parse(latLng2[0]);
  double longitude2 = double.parse(latLng2[1]);

  Point point1 = Point(latitude1, longitude1);
  Point point2 = Point(latitude2, longitude2);

  double distance = Calculations.calculateDistance(point1, point2);
  print(
      "The distance between the two points is approximately ${distance.toStringAsFixed(2)} kilometers.");
}
