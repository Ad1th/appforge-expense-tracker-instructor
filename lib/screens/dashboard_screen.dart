import 'package:flutter/material.dart';

import '../data/sample_expenses.dart';
import '../models/expense.dart';
import 'add_expense_screen.dart';

/// The home screen. Holds the list of expenses and shows a spending
/// summary plus the list of recent expenses.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Expense> _expenses = [...sampleExpenses];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Expenses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddExpenseScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      body: Center(
        child: Text('${_expenses.length} expenses recorded'),
      ),
    );
  }
}
