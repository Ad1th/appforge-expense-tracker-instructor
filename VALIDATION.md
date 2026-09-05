# Validation status

These repos were assembled in an environment **without the Flutter/Dart SDK**,
so the SDK-dependent checks below could not be executed here and should be run
once on a machine with Flutter installed.

## Done here (no SDK required)

- [x] Full `lib/` + `test/` source written by hand, beginner-oriented.
- [x] Instructor history built as 35 small commits + 6 checkpoint tags.
- [x] Every commit scanned: balanced `{}`, `()`, `[]` in all `.dart` files;
      every `import` target exists at that commit.
- [x] `git diff <prev> <commit>` inspected for every step — each is one small,
      explainable change; no unrelated edits mixed in.
- [x] Student repo's files are byte-identical to the instructor's first commit
      (shared files: `lib/`, `test/`, `pubspec.yaml`, configs).
- [x] No third-party dependencies (only `flutter`, `flutter_test`,
      `flutter_lints`). No secrets, keys, or credentials.

## Run once on a machine with Flutter

```bash
cd appforge-expense-tracker-instructor    # (and again in the student repo)
flutter create .            # generates android/ ios/ web/ ... (won't touch lib/)
flutter pub get
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
flutter run                 # smoke-test the finished app
```

Then walk the instructor history to confirm each stage builds:

```bash
git checkout checkpoint-01-project-setup && flutter run
git checkout checkpoint-02-dart-model    && flutter analyze
git checkout checkpoint-03-dashboard     && flutter run
git checkout checkpoint-04-expense-form  && flutter run
git checkout checkpoint-05-functionality && flutter run
git checkout checkpoint-06-final-ui      && flutter test
git checkout main
```

## Known version note

`DropdownButtonFormField(value: ...)` is used in
`lib/screens/add_expense_screen.dart`. On Flutter 3.24+ the analyzer emits a
deprecation hint suggesting `initialValue:`. It still compiles and runs. If your
workshop machines are on 3.24+, either ignore the hint or rename the argument to
`initialValue:` in commit *"feat: add a category dropdown to the form"* and
carry it forward.
