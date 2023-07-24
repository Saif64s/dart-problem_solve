import 'dart:io';

class UserInput {
  List<double> getCoordinates(String prompt) {
    print(prompt);
    String input = stdin.readLineSync()!;
    List<String> latLng = input.split(' ');
    double latitude = double.parse(latLng[0]);
    double longitude = double.parse(latLng[1]);
    return [latitude, longitude];
  }
}
