abstract class Condition {
  bool inverted = false;
  bool disabled = false;

  //Constructor
  Condition(this.inverted, this.disabled);

  //If the condition is met
  bool isMet();
}