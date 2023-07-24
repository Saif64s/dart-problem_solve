abstract class Dev {
  void knowsProgramming();
}

//! Working as Implicit Interface
abstract class KnowsCSS {
  void workOnCSS();
}

//! Working as Implicit Interface
abstract class KnowsHtml {
  void workOnHtml();
}

//! Working as Implicit Interface
abstract class KnowsExpressJS {
  void workOnMakingApi();
}

class FrontEndDev implements Dev, KnowsCSS, KnowsHtml {
  @override
  void knowsProgramming() {
    print("Making call from smartwatch");
  }

  @override
  void workOnCSS() {
    print("WOkring on CSS styling");
  }

  @override
  void workOnHtml() {
    print("Working on HTML File for frontend");
  }
}

class BackEndDev implements Dev, KnowsHtml, KnowsExpressJS {
  @override
  void workOnMakingApi() {
    print("browsing from phone");
  }

  @override
  void knowsProgramming() {
    print("Making call from Mobile");
  }

  @override
  void workOnHtml() {
    print("Knows EJS template engine");
  }
}

void main(List<String> args) {
  var saif = BackEndDev();
  saif.knowsProgramming();
  saif.workOnMakingApi();

  var abhijit = FrontEndDev();
  abhijit.knowsProgramming();
  abhijit.workOnCSS();
}
