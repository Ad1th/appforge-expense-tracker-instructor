import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';

void main() {
  runApp(const ExpenseTrackerApp());
}

/// The root widget of the whole application.
///
/// It is a [StatelessWidget] because it never changes after it is built.
class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppForge Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const DashboardScreen(),
    );
  }
}
