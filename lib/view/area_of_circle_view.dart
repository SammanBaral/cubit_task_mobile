import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/area_of_circle_cubit.dart';

class AreaOfCircleView extends StatelessWidget {
  const AreaOfCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text(" Samman's Area of Circle")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: radiusController,
              decoration: const InputDecoration(labelText: 'Radius'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double radius = double.parse(radiusController.text);
                context.read<AreaOfCircleCubit>().calculate(radius);
              },
              child: const Text('Calculate'),
            ),
            BlocBuilder<AreaOfCircleCubit, double>(
              builder: (context, area) {
                return Text('Area: $area');
              },
            ),
          ],
        ),
      ),
    );
  }
}
