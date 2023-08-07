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
        child: Column(children: [
          const Text('Add Your New Expenses Here'),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(label: Text('Title')),
            ),
          ),
          // const SizedBox(
          //   height: 16,
          // ),
          Expanded(
            child: Row(
              children: [
                const Text('\$'),
                const Expanded(child: TextField()),
                const Text('Date:'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
