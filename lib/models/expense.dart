/// The kinds of expense the app understands.
enum ExpenseCategory { food, transport, shopping, bills, other }

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
