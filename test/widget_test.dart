import 'package:flutter_test/flutter_test.dart';

import 'package:appforge_expense_tracker/main.dart';

void main() {
  testWidgets('App starts on the dashboard screen', (tester) async {
    await tester.pumpWidget(const ExpenseTrackerApp());

    // The dashboard's AppBar shows the app title.
    expect(find.text('My Expenses'), findsOneWidget);
  });
}
