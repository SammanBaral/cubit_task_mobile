import 'package:class_assignment_2/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Samman's Class Assignment 2"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: _dashboardItems.length,
          itemBuilder: (context, index) {
            final item = _dashboardItems[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () => item.onTap(context),
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 48, color: Colors.blue),
                    const SizedBox(height: 8),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<_DashboardItem> get _dashboardItems => [
        _DashboardItem(
          title: "Simple Interest",
          icon: Icons.attach_money,
          onTap: (context) =>
              context.read<DashboardCubit>().openSimpleInterestView(context),
        ),
        _DashboardItem(
          title: "Area of Circle",
          icon: Icons.circle,
          onTap: (context) =>
              context.read<DashboardCubit>().openAreaOfCircleCubitVIew(context),
        ),
        _DashboardItem(
          title: "Calculator",
          icon: Icons.calculate,
          onTap: (context) =>
              context.read<DashboardCubit>().openCalculatorView(context),
        )
      ];
}

class _DashboardItem {
  final String title;
  final IconData icon;
  final void Function(BuildContext) onTap;

  _DashboardItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
