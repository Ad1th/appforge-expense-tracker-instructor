import 'package:flutter/material.dart';

import 'add_expense_screen.dart';

/// The home screen of the app.
///
/// Right now it only shows a placeholder. During the workshop you will turn
/// this into a dashboard with:
///
///   * a "total spending" card
///   * a breakdown of spending per category
///   * a list of recent expenses
///
/// It will also need to become a [StatefulWidget] so it can hold the list of
/// expenses and rebuild when that list changes.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
          // Navigation skeleton: open the "Add Expense" screen.
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddExpenseScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
      body: const Center(
        // TODO(workshop): Replace this placeholder with the real dashboard.
        child: Text('Your dashboard will go here'),
      ),
    );
  }
}
