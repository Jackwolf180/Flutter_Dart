import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State createState() => _NewExpenseState();
}

var _enteredTtitle = "";

void _saveTitleInput(String inputValue) {
  _enteredTtitle = inputValue;
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const TextField(
            onChanged: _saveTitleInput,
            maxLength: 50,
            // keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_enteredTtitle);
                  },
                  child: const Text("Save Expense"))
            ],
          )
        ],
      ),
    );
  }
}
