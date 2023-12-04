abstract class CalculatorEvent {}

class NumberPressed extends CalculatorEvent {
  final String value;

  NumberPressed(this.value);
}

class OperatorPressed extends CalculatorEvent {
  final String operator;

  OperatorPressed(this.operator);
}

class EqualsPressed extends CalculatorEvent {}

class ClearPressed extends CalculatorEvent {}
