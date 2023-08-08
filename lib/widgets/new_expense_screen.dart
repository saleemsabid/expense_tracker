import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  void _submitExpenseData() {
    widget.onAddExpense(Expense(
      title: '',
      amount: 15,
      category: Category.food,
      date: DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Add Your New Expenses Here'),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Title')),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text(
                      'Amount',
                    ),
                    prefix: Text('\$')),
              )),
              const Text('Date:'),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Text('Category'),
              const SizedBox(
                width: 16,
              ),
              DropdownButton(items: const [
                DropdownMenuItem(
                  child: Text('Work'),
                ),
              ], onChanged: (value) {})
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('cancel'),
                ),
                ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text('Save'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
