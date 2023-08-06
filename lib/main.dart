import 'package:flutter/material.dart';

//file imports
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Expenses(),
  ));
  WidgetsFlutterBinding.ensureInitialized();
}
