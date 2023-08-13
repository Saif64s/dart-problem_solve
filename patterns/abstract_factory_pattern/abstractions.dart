abstract class Button {
  void render();
}

abstract class TextField {
  void render();
}

abstract class UIFactory {
  Button createButton();
  TextField createTextField();
}
