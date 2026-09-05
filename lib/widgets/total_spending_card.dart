import 'package:flutter/material.dart';

import '../utils/format.dart';

/// A big card at the top of the dashboard showing total spending.
class TotalSpendingCard extends StatelessWidget {
  const TotalSpendingCard({super.key, required this.total});

  final double total;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total spending',
            style: TextStyle(color: colors.onPrimary, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            formatCurrency(total),
            style: TextStyle(
              color: colors.onPrimary,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
