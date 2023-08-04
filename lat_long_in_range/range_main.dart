import 'dart:convert';
import 'dart:io';

import 'calculator.dart';
import 'coordinate.dart';
import 'file_reader.dart';

void main() async {
  final jsonFilePath = 'lat_long_in_range/lat_long.json';
  final fileReader = FileReader();
  final coordinateCalculator = CoordinateCalculator();

  final contents = await fileReader.readFileContents(jsonFilePath);
  if (contents == null) {
    return;
  }

  var data = jsonDecode(contents);

  var coordinates = (data['coordinates'] as List)
      .map((coordinate) => Coordinate(coordinate['latitude'].toDouble(),
          coordinate['longitude'].toDouble()))
      .toList();

  stdout.writeln('Enter the latitude and longitude of your base: ');
  stdout.write('\nLatitude : ');
  double? startLatitude = double.tryParse(stdin.readLineSync()!);
  stdout.write('\nLongitude : ');
  double? startLongitude = double.tryParse(stdin.readLineSync()!);
  Coordinate referencePoint = Coordinate(startLatitude!, startLongitude!);

  double? range;
  while (range == null) {
    stdout.write('\nRange (km) : ');
    String? input = stdin.readLineSync();
    if (input != null && input.isNotEmpty) {
      range = double.tryParse(input);
    }
  }

  var coordinatesInRange = coordinateCalculator.filterCoordinatesByRange(
      coordinates, referencePoint, range * 1000); // Convert range to meters

  for (var coordinate in coordinatesInRange) {
    print(
        '✅ - Coordinate ${coordinate.latitude}, ${coordinate.longitude} is within the range.');
  }
}
