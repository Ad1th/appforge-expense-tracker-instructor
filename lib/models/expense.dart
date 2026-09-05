/// A single expense the user has recorded.
///
/// Every expense has a short [title], an [amount] of money and the
/// [date] it happened.
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  });

  final String title;
  final double amount;
  final DateTime date;
}
