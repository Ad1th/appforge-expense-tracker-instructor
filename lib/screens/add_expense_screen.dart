import 'package:flutter/material.dart';

/// A screen with a form for adding a new expense.
///
/// During the workshop you will add:
///
///   * a description text field
///   * an amount text field
///   * a category selector
///   * a date picker
///   * validation
///   * a "Save" button that returns the new expense to the dashboard
///
/// It will need to become a [StatefulWidget] so it can remember what the
/// user has typed.
class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: const Center(
        // TODO(workshop): Build the "add expense" form here.
        child: Text('The add-expense form will go here'),
      ),
    );
  }
}
