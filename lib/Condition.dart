abstract class Condition {
  bool inverted;
  bool disabled;

  //If the condition is met
  bool isMet();

  //Constructor
  Condition(this.inverted, this.disabled);
}