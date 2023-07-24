import 'sql.dart';

void main(List<String> args) {
  final mySqlConnection = SQLConnection();

  mySqlConnection.connect();
}
