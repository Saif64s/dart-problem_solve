abstract class User {
  List<String> listOfFeatures();
}

abstract class FreeUser extends User {
  void featuresForFreeUsers();
}

abstract class PremiumUser extends User {
  void featuresForPremiumUsers();
}

class Saif extends FreeUser {
  @override
  void featuresForFreeUsers() {
    print('As a free user You can only use 3 of our Features.');
  }

  @override
  List<String> listOfFeatures() {
    return [
      'Image',
      'Call to Action',
      'Separators',
    ];
  }
}

class RafinBhai extends PremiumUser {
  @override
  void featuresForPremiumUsers() {
    print('Thanks for buying our plan. You an use all the features');
  }

  @override
  List<String> listOfFeatures() {
    return [
      'Image',
      'Title',
      'Body or Paragraph Text',
      'Call to Action',
      'Separators',
    ];
  }
}

void main(List<String> args) {
  var saif = Saif();
  var rafinBhai = RafinBhai();

  print('\n');
  saif.featuresForFreeUsers();
  print(saif.listOfFeatures().join(', '));

  print('\n');
  rafinBhai.featuresForPremiumUsers();
  print(rafinBhai.listOfFeatures().join(', '));
}
