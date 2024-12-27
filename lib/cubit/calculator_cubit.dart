import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<String> {
  CalculatorCubit() : super("0");

  double _currentValue = 0;
  String _operation = "";

  void inputDigit(String digit) {
    if (state == "0" || (_operation.isNotEmpty && !_stateEndsWithOperation())) {
      emit(digit);
    } else {
      emit(state + digit);
    }
  }

  void setOperation(String operation) {
    if (_stateEndsWithOperation()) {
      emit(state.substring(0, state.length - 1) +
          operation); 
    } else {
      _currentValue = double.tryParse(state) ?? 0;
      emit(state + operation);
    }
    _operation = operation;
  }

  void calculate() {
    final parts = state.split(RegExp(r"[+\-*/]"));
    if (parts.length < 2) return;

    double newValue = double.tryParse(parts.last) ?? 0;
    double result;

    switch (_operation) {
      case "+":
        result = _currentValue + newValue;
        break;
      case "-":
        result = _currentValue - newValue;
        break;
      case "*":
        result = _currentValue * newValue;
        break;
      case "/":
        result = newValue != 0 ? _currentValue / newValue : double.infinity;
        break;
      default:
        return;
    }

    emit(result.toString());
    _currentValue = 0;
    _operation = "";
  }

  void clear() {
    _currentValue = 0;
    _operation = "";
    emit("0");
  }

  bool _stateEndsWithOperation() {
    return state.endsWith("+") ||
        state.endsWith("-") ||
        state.endsWith("*") ||
        state.endsWith("/");
  }
}
