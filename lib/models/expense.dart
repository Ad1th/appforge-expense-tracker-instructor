/// A single expense the user has recorded.
///
/// Every expense has a short [title] and an [amount] of money.
class Expense {
  Expense({
    required this.title,
    required this.amount,
  });

  final String title;
  final double amount;
}
