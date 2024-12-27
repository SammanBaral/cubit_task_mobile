import 'package:class_assignment_2/core/app_theme.dart';
import 'package:class_assignment_2/cubit/calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/area_of_circle_cubit.dart';
import 'cubit/dashboard_cubit.dart';
import 'cubit/simple_interest_cubit.dart';
import 'view/dashboard_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SimpleInterestCubit()),
        BlocProvider(create: (_) => AreaOfCircleCubit()),
        BlocProvider(create: (_) => CalculatorCubit()),
        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<SimpleInterestCubit>(),
            context.read<AreaOfCircleCubit>(),
            context.read<CalculatorCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Samman's class_assignment_2",
        theme: getApplicationTheme(),
        home: const DashboardView(),
      ),
    );
  }
}
