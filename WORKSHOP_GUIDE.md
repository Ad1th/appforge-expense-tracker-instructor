# AppForge Workshop Guide (Instructor Only)

Walk the commits in order (`git log --oneline --reverse`). For each one:
`git show <commit>` → explain the diff → `flutter run` / hot reload → students
copy the change.

Legend for "Commit": the number is the position in history after the starter
commit (`git log --oneline --reverse` line number minus 1).

---

## Checkpoint 1 — Project setup & theme

**Demo after checkout:** run the app, show the plain "My Expenses" screen and the
placeholder "Add" screen. Walk the folder tree: `main.dart` → `runApp` →
`MaterialApp` → `home:` → `DashboardScreen`. Define "widget", "widget tree",
"`StatelessWidget` = never changes".

| Commit | Concept | What changed | Teaching point |
| ------ | ------- | ------------ | -------------- |
| 1 | Theme, single source of truth | New `lib/theme.dart` with `appTheme`; `main.dart` uses `theme: appTheme` | A `ThemeData` built from one seed colour styles the whole app. Keeping it in its own file means one place to restyle. Show `ColorScheme.fromSeed`. |

---

## Checkpoint 2 — Dart fundamentals through the `Expense` model

**Demo after checkout:** open `lib/models/expense.dart` and `lib/data/sample_expenses.dart`.
Nothing visible in the app yet — this checkpoint is pure Dart. Use DartPad-style
explanations right in the files.

| Commit | Concept | What changed | Teaching point |
| ------ | ------- | ------------ | -------------- |
| 2 | Class, `final` fields, named constructor params | `Expense` class with `title` (`String`) and `amount` (`double`) | A class is a blueprint. `final` = set once. `required` named params make call sites readable: `Expense(title: ..., amount: ...)`. |
| 3 | More types: `DateTime` | Added `date` field | Dart has real date/time objects. Same constructor pattern, one more field. |
| 4 | `enum` | Added `ExpenseCategory { food, transport, shopping, bills, other }` and a `category` field | An enum is a fixed set of named values. Safer than passing strings around. |
| 5 | `switch`, extension getter | `ExpenseCategoryInfo` extension: `label` getter via `switch` | Extensions add methods/getters to a type you don't own. `switch` must cover every enum value. |
| 6 | Icons, more `switch` | Added `icon` getter to the same extension | `IconData` is just data describing an icon. Same shape as `label`. |
| 7 | `List` literals, constructing objects | New `sample_expenses.dart` with a `List<Expense>` | `[...]` builds a list. `DateTime.now().subtract(Duration(days: n))` for fake recent dates. |
| 8 | Functions, string interpolation, `??` | New `lib/utils/format.dart`: `formatCurrency`, `formatShortDate` | Small pure functions. `'\$${x.toStringAsFixed(2)}'`. A `const` months list + `date.month - 1` index. |

---

## Checkpoint 3 — The dashboard

**Demo after checkout:** the dashboard now shows a purple total card, a category
breakdown, and a scrollable list of expense cards from the sample data.

| Commit | Concept | What changed | Teaching point |
| ------ | ------- | ------------ | -------------- |
| 9 | `StatelessWidget` → `StatefulWidget` | `DashboardScreen` split into widget + `_DashboardScreenState` | Why: the screen will hold data that changes. Show the `createState()` boilerplate; UI is identical for now. |
| 10 | State field, `List` | `final List<Expense> _expenses = [...sampleExpenses];`; body shows `_expenses.length` | State lives in the `State` class. `[...sampleExpenses]` makes a copy we can edit. |
| 11 | `ListView` | Body becomes a scrolling `ListView` with padding | `Column` overflows; `ListView` scrolls. `EdgeInsets.all(16)` for breathing room. |
| 12 | Getter, `for` loop, accumulator | `double get _totalSpending` sums the list; shown as text | A getter is a computed property. `var total = 0.0; for (...) total += e.amount;`. |
| 13 | Extract a widget, constructor param | New `TotalSpendingCard(total:)`; dashboard uses it | Move UI into a named widget that takes data in. `Container` + `BoxDecoration` for the rounded card. |
| 14 | Reusable widget with a model param | New `ExpenseCard(expense:)`; shown once for `_expenses.first` | One widget, many uses. `Row` + `Expanded` layout; `CircleAvatar` with the category icon. |
| 15 | Collection-`for` in a child list | `for (final e in _expenses) ExpenseCard(expense: e)` | You can build a list of widgets with `for` directly inside `children: [ ]`. |
| 16 | Section heading, spacing | Added "Recent expenses" `Text` + `SizedBox` | Small structural UI; `SizedBox(height:)` is the standard spacer. |
| 17 | `Map` aggregation, `??` | `Map<ExpenseCategory,double> get _categoryTotals`; simple inline rows | `totals[c] = (totals[c] ?? 0) + amount;` is the classic "group and sum". |
| 18 | Refactor to a widget (behaviour unchanged) | New `CategoryBreakdown(totals:)`; dashboard passes the map in | A pure refactor: diff shows code *moving*, not changing. Great "before/after" moment. |

---

## Checkpoint 4 — The Add Expense form

**Demo after checkout:** tap "Add" — the screen now has a real form: description,
amount, category dropdown, date row, Save button, with validation errors.

| Commit | Concept | What changed | Teaching point |
| ------ | ------- | ------------ | -------------- |
| 19 | `StatefulWidget`, `Form`, `GlobalKey` | `AddExpenseScreen` becomes stateful; `Form` with `_formKey` | The form needs to remember input, so it needs state. `GlobalKey<FormState>` lets us validate later. |
| 20 | `TextEditingController`, `dispose` | Description `TextFormField` + controller | A controller reads what the user typed. Always `dispose()` controllers to avoid leaks. |
| 21 | Numeric input | Amount `TextFormField` with `keyboardType` + `prefixText: '\$ '` | Same pattern; `TextInputType.numberWithOptions(decimal: true)` shows a number pad. |
| 22 | `DropdownButtonFormField`, enum values | Category dropdown built from `ExpenseCategory.values` | `for (final c in ExpenseCategory.values) DropdownMenuItem(...)`. `onChanged` + `setState`. |
| 23 | `Future`/`async`/`await` | `_pickDate()` calls `showDatePicker`; date row with a "Change" button | `await` pauses until the user picks. Null check: they may cancel. |
| 24 | Button wiring, stub method | `FilledButton` calls `_submit()` (empty for now) | Wire the UI first, fill the behaviour next commit — keeps diffs small. |
| 25 | `validator`, `double.tryParse` | Validators on both fields; `_submit` calls `_formKey.currentState!.validate()` | A validator returns an error `String` or `null`. `tryParse` returns `null` instead of throwing. |

---

## Checkpoint 5 — Connect the form to the data

**Demo after checkout:** add a real expense from the form and watch it appear at
the top of the list with the total and category breakdown updating. Delete one
and watch everything recompute.

| Commit | Concept | What changed | Teaching point |
| ------ | ------- | ------------ | -------------- |
| 26 | Build an object, `Navigator.pop` with a value | `_submit` creates an `Expense` and `Navigator.pop(newExpense)` | The form's job: turn input into a model object and hand it back. |
| 27 | `Navigator.push<T>`, `setState`, `List.insert` | Dashboard `_openAddExpenseScreen` awaits the result; `_addExpense` inserts at index 0 | `push<Expense>` returns what the next screen popped. `setState` tells Flutter to rebuild. |
| 28 | Callback parameter (`VoidCallback`) | `ExpenseCard` gains `onDelete`; adds a close `IconButton` | A child widget reports events upward via a function passed in. The card doesn't know *what* delete does. |
| 29 | `List.remove`, live recompute | Dashboard `_deleteExpense` + `onDelete: () => _deleteExpense(e)` | Remove from the list in `setState`; the total and breakdown getters recompute on the rebuild — no extra wiring. |

---

## Checkpoint 6 — Empty states & polish

**Demo after checkout:** delete every expense to see the empty state; add one back.
Point out the icons and spacing refinements.

| Commit | Concept | What changed | Teaching point |
| ------ | ------- | ------------ | -------------- |
| 30 | Conditional widgets | `if (_expenses.isEmpty) ... else for (...)` in the child list | You can branch inside `children: [ ]`. Empty states make an app feel finished. |
| 31 | `where`, `SizedBox.shrink` | `CategoryBreakdown` filters to `value > 0` and renders nothing when empty | `iterable.where((x) => ...)` filters. `SizedBox.shrink()` = "draw nothing". |
| 32 | Visual detail | Icons + tighter spacing in the breakdown rows | Small `Icon` + `SizedBox`; behaviour unchanged. |
| 33 | Visual detail | Subtle border on `ExpenseCard` | One line in `BoxDecoration`. Polish belongs in its own commit, never mixed with logic. |
| 34 | Widget test | `test/widget_test.dart` checks the three section labels render | `tester.pumpWidget`, `find.text`, `expect(..., findsOneWidget)`. |
| 35 | Docs | README note about the finished app | Housekeeping. |

---

## If you fall behind

Each checkpoint tag is a safe resume point. Tell students to run
`git checkout checkpoint-0X-...` (they can `git stash` first) to jump to the
start of the next section.
