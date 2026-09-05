import '../models/expense.dart';

/// A few example expenses so the dashboard has something to show
/// the first time the app runs.
final List<Expense> sampleExpenses = [
  Expense(
    title: 'Groceries',
    amount: 42.50,
    category: ExpenseCategory.food,
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Expense(
    title: 'Bus pass',
    amount: 25.00,
    category: ExpenseCategory.transport,
    date: DateTime.now().subtract(const Duration(days: 2)),
  ),
  Expense(
    title: 'Headphones',
    amount: 89.99,
    category: ExpenseCategory.shopping,
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
  Expense(
    title: 'Phone bill',
    amount: 30.00,
    category: ExpenseCategory.bills,
    date: DateTime.now().subtract(const Duration(days: 5)),
  ),
];
