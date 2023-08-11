import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(categoryIcons[expense.category]),
        title: Text(
          expense.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(expense.formattedDate),
        trailing: Text(
          '\$ ${expense.amount.toStringAsFixed(2)}',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
