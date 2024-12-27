import 'package:class_assignment_2/cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Samman's Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: BlocBuilder<CalculatorCubit, String>(
              builder: (context, display) {
                return Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    display,
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                ..._buildNumberButtons(context),
                ..._buildOperationButtons(context),
                _buildClearButton(context),
                _buildEqualsButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNumberButtons(BuildContext context) {
    return List.generate(10, (index) {
      return ElevatedButton(
        onPressed: () =>
            context.read<CalculatorCubit>().inputDigit(index.toString()),
        child: Text(
          index.toString(),
          style: const TextStyle(fontSize: 24),
        ),
      );
    });
  }

  List<Widget> _buildOperationButtons(BuildContext context) {
    final operations = ["+", "-", "*", "/"];
    return operations.map((operation) {
      return ElevatedButton(
        onPressed: () =>
            context.read<CalculatorCubit>().setOperation(operation),
        child: Text(
          operation,
          style: const TextStyle(fontSize: 24),
        ),
      );
    }).toList();
  }

  Widget _buildClearButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<CalculatorCubit>().clear(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text(
        "C",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget _buildEqualsButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<CalculatorCubit>().calculate(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text(
        "=",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
