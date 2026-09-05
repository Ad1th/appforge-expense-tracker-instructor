import 'package:flutter/material.dart';

import '../data/sample_expenses.dart';
import '../models/expense.dart';
import '../widgets/category_breakdown.dart';
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

  Map<ExpenseCategory, double> get _categoryTotals {
    final totals = <ExpenseCategory, double>{};
    for (final expense in _expenses) {
      totals[expense.category] =
          (totals[expense.category] ?? 0) + expense.amount;
    }
    return totals;
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.insert(0, expense);
    });
  }

  void _deleteExpense(Expense expense) {
    setState(() {
      _expenses.remove(expense);
    });
  }

  Future<void> _openAddExpenseScreen() async {
    final newExpense = await Navigator.of(context).push<Expense>(
      MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
    );

    if (newExpense != null) {
      _addExpense(newExpense);
    }
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
        onPressed: _openAddExpenseScreen,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TotalSpendingCard(total: _totalSpending),
          const SizedBox(height: 24),
          CategoryBreakdown(totals: _categoryTotals),
          const SizedBox(height: 24),
          const Text(
            'Recent expenses',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          if (_expenses.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  'No expenses yet.\nTap "Add" to record your first one.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          else
            for (final expense in _expenses)
              ExpenseCard(
                expense: expense,
                onDelete: () => _deleteExpense(expense),
              ),
        ],
      ),
    );
  }
}
