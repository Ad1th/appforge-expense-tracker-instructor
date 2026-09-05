/// Formats a number as a dollar amount, e.g. 42.5 -> "$42.50".
String formatCurrency(double amount) {
  return '\$${amount.toStringAsFixed(2)}';
}

/// Formats a date as a short string, e.g. "5 Sep".
String formatShortDate(DateTime date) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  return '${date.day} ${months[date.month - 1]}';
}
