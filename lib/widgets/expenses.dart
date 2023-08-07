import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Trip to Tirur',
      amount: 9.69,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Flutter Course',
      amount: 69.69,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Food',
      amount: 169.69,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(child: ExpensesList(expenses: _registeredExpenses)),
            ],
          ),
        ));
  }
}
