import 'package:flutter_test/flutter_test.dart';

import 'package:appforge_expense_tracker/main.dart';

void main() {
  testWidgets('Dashboard renders its main sections', (tester) async {
    await tester.pumpWidget(const ExpenseTrackerApp());

    expect(find.text('My Expenses'), findsOneWidget);
    expect(find.text('Total spending'), findsOneWidget);
    expect(find.text('Recent expenses'), findsOneWidget);
  });
}
