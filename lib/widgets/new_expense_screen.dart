import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
//function to display the date picker when clicking on the calendar icon
  void _displayDatePicker() async {
    final now = DateTime.now();
    final currentDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: currentDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Invalid Inputs',
          ),
          content: const Text(
            'Please make sure a valid title, amount and date is chosen',
          ),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(ctx);
                  });
                },
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(Expense(
      title: _titleController.text,
      amount: enteredAmount,
      category: _selectedCategory,
      date: _selectedDate!,
    ));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
      child: Column(children: [
        Text('Add Your New Expenses Here',
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 16,
        ),
        TextField(
          controller: _titleController,
          maxLength: 30,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: TextField(
              keyboardType: TextInputType.number,
              controller: _amountController,
              decoration: const InputDecoration(
                  label: Text(
                    'Amount',
                  ),
                  prefix: Text('\$')),
            )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No Date Selected'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _displayDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
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
            DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (category) {
                  setState(() {
                    if (category == null) {
                      return;
                    }
                    _selectedCategory = category;
                  });
                })
          ],
        ),
        Row(
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
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}
