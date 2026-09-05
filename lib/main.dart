import 'package:flutter/material.dart';

import 'screens/dashboard_screen.dart';
import 'theme.dart';

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
      theme: appTheme,
      home: const DashboardScreen(),
    );
  }
}
