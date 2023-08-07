import 'package:flutter/material.dart';

//file imports
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(useMaterial3: true),
    home: const Expenses(),
  ));
  WidgetsFlutterBinding.ensureInitialized();
}
