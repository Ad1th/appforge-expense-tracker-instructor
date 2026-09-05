import 'package:flutter/material.dart';

import '../data/sample_expenses.dart';
import '../models/expense.dart';
import '../widgets/expense_card.dart';
import '../widgets/total_spending_card.dart';
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

  double get _totalSpending {
    var total = 0.0;
    for (final expense in _expenses) {
      total += expense.amount;
    }
    return total;
  }

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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TotalSpendingCard(total: _totalSpending),
          const SizedBox(height: 24),
          for (final expense in _expenses)
            ExpenseCard(expense: expense),
        ],
      ),
    );
  }
}
