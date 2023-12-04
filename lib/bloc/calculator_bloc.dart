import 'package:bloc/bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState('')) {
    on<NumberPressed>((event, emit) {
      emit(CalculatorState(state.display + event.value));
    });

    on<OperatorPressed>((event, emit) {
      emit(CalculatorState(state.display + event.operator));
    });

    on<EqualsPressed>((event, emit) {
      try {
        var result = calculateResult(state.display);
        emit(CalculatorState(result.toString()));
      } catch (e, stackTrace) {
        print('Error in calculateResult: $e');
        print('Stack trace: $stackTrace');
        emit(CalculatorState('Error'));
      }
    });

    on<ClearPressed>((event, emit) {
      emit(CalculatorState(''));
    });
  }

  double calculateResult(String expression) {
    print('Calculating result for expression: $expression');
    List<String> parts = expression.split(' ');

    if (parts.length != 3) {
      throw FormatException('Invalid expression format');
    }

    double? operand1 = double.tryParse(parts[0]);
    double? operand2 = double.tryParse(parts[2]);

    if (operand1 == null || operand2 == null) {
      throw FormatException('Invalid operands');
    }

    switch (parts[1]) {
      case '+':
        return operand1 + operand2;
      case '-':
        return operand1 - operand2;
      case '*':
        return operand1 * operand2;
      case '/':
        if (operand2 == 0) {
          throw FormatException('Cannot divide by zero');
        }
        return operand1 / operand2;
      default:
        throw FormatException('Invalid operator');
    }
  }
}
