import 'package:flutter/material.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({super.key});

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Add Your New Expenses Here'),
          // const SizedBox(
          //   height: 16,
          // ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('cancel'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
              )
            ],
          )
        ]),
      ),
    );
  }
}
