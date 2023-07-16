import 'dart:io';

Stream<String> getDots() async* {
  for (var i = 0; i < 4; i++) {
    yield ('.');
    await Future.delayed(Duration(milliseconds: 300));
  }
}

void main(List<String> args) async {
  await for (var val in getDots()) {
    stdout.write(val);
  }
}
