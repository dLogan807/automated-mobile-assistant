abstract class Condition {
  bool _inverted;
  bool _disabled;

  //Getters
  bool get inverted => _inverted;
  bool get disabled => _disabled;

  //Constructor
  Condition(this._inverted, this._disabled);

  //Setters
  set inverted(bool value) {
    if (value != null) {
      _inverted = value;
    }
  }
  set disabled(bool value) {
    if (value != null) {
      _disabled = value;
    }
  }

  //If the condition is met
  bool isMet();
}