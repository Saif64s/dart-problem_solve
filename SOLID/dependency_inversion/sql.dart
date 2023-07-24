import 'db_connection_interface.dart';

class SQLConnection implements DBConnectionInterface {
  @override
  connect() {
    print("Database connected on port 3000");
  }
}
