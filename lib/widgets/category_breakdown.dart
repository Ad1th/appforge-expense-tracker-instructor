import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../utils/format.dart';

/// Shows how much has been spent in each category.
class CategoryBreakdown extends StatelessWidget {
  const CategoryBreakdown({super.key, required this.totals});

  /// A map of category -> total amount spent in that category.
  final Map<ExpenseCategory, double> totals;

  @override
  Widget build(BuildContext context) {
    final entries =
        totals.entries.where((entry) => entry.value > 0).toList();

    if (entries.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'By category',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        for (final entry in entries)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(child: Text(entry.key.label)),
                Text(formatCurrency(entry.value)),
              ],
            ),
          ),
      ],
    );
  }
}
