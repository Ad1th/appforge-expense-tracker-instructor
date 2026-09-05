import 'package:flutter/material.dart';

/// The kinds of expense the app understands.
enum ExpenseCategory { food, transport, shopping, bills, other }

/// Human-friendly text and an icon for each [ExpenseCategory].
extension ExpenseCategoryInfo on ExpenseCategory {
  String get label {
    switch (this) {
      case ExpenseCategory.food:
        return 'Food';
      case ExpenseCategory.transport:
        return 'Transport';
      case ExpenseCategory.shopping:
        return 'Shopping';
      case ExpenseCategory.bills:
        return 'Bills';
      case ExpenseCategory.other:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case ExpenseCategory.food:
        return Icons.restaurant;
      case ExpenseCategory.transport:
        return Icons.directions_bus;
      case ExpenseCategory.shopping:
        return Icons.shopping_bag;
      case ExpenseCategory.bills:
        return Icons.receipt_long;
      case ExpenseCategory.other:
        return Icons.category;
    }
  }
}

/// A single expense the user has recorded.
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;
}
