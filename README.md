# AppForge — Expense Tracker (Instructor Repo)

This repository is the **source of truth** for the AppForge Flutter workshop.
It contains the finished Expense Tracker app, built from the student starter in
**many small, teachable Git commits**.

Screen-share this repo during the workshop and walk the commits in order.

> The student starter repo (`appforge-expense-tracker-student`) is exactly this
> repo's **first commit**, minus this README and `WORKSHOP_GUIDE.md`.

---

## How to drive the workshop

```bash
# see the whole plan
git log --oneline

# jump to the start
git checkout checkpoint-01-project-setup

# step forward one teachable change at a time
git checkout HEAD@{1}          # or check out the next commit hash

# show the room what changed in a commit
git show <commit>              # diff + message
git diff <commitA> <commitB>   # diff between any two points
```

A comfortable rhythm per commit:

1. `git show <commit>` — read the diff together.
2. Explain **why** those lines were added (see `WORKSHOP_GUIDE.md`).
3. `flutter run` (hot-reload) so everyone sees the effect.
4. Students make the same change in their copy.

---

## First-time setup

The Dart code is here; the platform folders are not. Generate them once:

```bash
flutter create .
flutter pub get
flutter run
```

---

## Checkpoints (Git tags)

| Tag                            | Section                                   |
| ------------------------------ | ----------------------------------------- |
| `checkpoint-01-project-setup`  | Flutter project structure + app theme     |
| `checkpoint-02-dart-model`     | Dart fundamentals via the `Expense` model |
| `checkpoint-03-dashboard`      | The dashboard / home screen               |
| `checkpoint-04-expense-form`   | The "Add Expense" form                    |
| `checkpoint-05-functionality`  | Adding, deleting, live totals             |
| `checkpoint-06-final-ui`       | Empty states + visual polish              |

Check one out with `git checkout checkpoint-03-dashboard`.

---

## Workshop progression (commit by commit)

`git log --oneline --reverse` gives the authoritative list. Summary:

### Phase 1 — Project & theme (`checkpoint-01`)
- `feat: add a reusable app theme` — one file that holds the app's colours;
  wire it into `MaterialApp`.

Concepts: `lib/` layout, `main.dart`, `runApp`, `MaterialApp`, `StatelessWidget`,
the widget tree, `ThemeData` / `ColorScheme.fromSeed`.

### Phase 2 — Dart through the model (`checkpoint-02`)
- `feat: create the Expense model with a title and amount`
- `feat: add a date to the Expense model`
- `feat: add an expense category enum`
- `feat: give each category a label` / `... an icon`
- `feat: add some sample expense data`
- `feat: add currency and date formatting helpers`

Concepts: classes, `final` fields, constructors, **named parameters**,
`required`, types (`String`, `double`, `DateTime`), **enums**, `switch`,
**extensions**, `List`, functions, string interpolation, null-aware `??`.

### Phase 3 — The dashboard (`checkpoint-03`)
- `refactor: turn the dashboard into a StatefulWidget`
- `feat: keep the list of expenses in dashboard state`
- `feat: give the dashboard a scrollable layout`
- `feat: calculate total spending`
- `feat: add the TotalSpendingCard widget`
- `feat: add the ExpenseCard widget`
- `feat: show every expense with a for-loop`
- `feat: add a "Recent expenses" heading`
- `feat: show a simple category breakdown on the dashboard`
- `refactor: move the category breakdown into its own widget`

Concepts: `StatefulWidget` vs `StatelessWidget`, `State`, `setState`, getters,
`for` loops, accumulating a total, `Map`, `Column`/`Row`/`ListView`,
`Container`/`BoxDecoration`, extracting a widget, passing data via constructors.

### Phase 4 — The Add Expense form (`checkpoint-04`)
- `refactor: turn the Add Expense screen into a StatefulWidget`
- `feat: add a description field to the form`
- `feat: add an amount field to the form`
- `feat: add a category dropdown to the form`
- `feat: add a date picker to the form`
- `feat: add a Save button to the form`
- `feat: validate the form fields`

Concepts: `Form` + `GlobalKey<FormState>`, `TextEditingController`, `dispose`,
`TextFormField`, `keyboardType`, `DropdownButtonFormField`, `showDatePicker`,
`Future`/`async`/`await`, `validator` functions, `double.tryParse`.

### Phase 5 — Connect it up (`checkpoint-05`)
- `feat: return the new expense when the form is saved`
- `feat: add the new expense to the list`
- `feat: let the ExpenseCard report a delete tap`
- `feat: delete an expense from the dashboard`

Concepts: `Navigator.push` / `pop` with a return value, building an object from
form input, `setState` to add/remove from a `List`, callback parameters
(`VoidCallback`), why the totals recompute "for free" (getters + rebuild).

### Phase 6 — Polish (`checkpoint-06`)
- `feat: show a message when there are no expenses`
- `feat: hide the category section until there is spending`
- `style: add icons and spacing to the category breakdown`
- `style: refine the expense card appearance`
- `test: check the dashboard renders its sections`

Concepts: conditional widgets (`if`/`else` in a child list), empty states,
`SizedBox.shrink`, `where` on an iterable, small visual refinements, a basic
widget test.

---

## What the finished app does

- Dashboard: total spending card, per-category breakdown, recent expenses list.
- Add Expense: description, amount, category, date, with validation.
- Add and delete expenses; all totals update live.
- Friendly empty state.
- In-memory data only — no backend, no database, no state-management packages.

See `WORKSHOP_GUIDE.md` for the per-commit teaching table.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01CEqtKrftfzov3UMN4U18Hi
