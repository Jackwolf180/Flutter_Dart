import 'package:basics/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final Function(Expense) onAddExpense;

  @override
  State createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime?
      _selectedDate; // we  use ? to tell that the selectedDate can possibly be null

  Catagory _selectedCatagory = Catagory.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      // it is similar to the promises in the Javascript
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseDate() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text(
              "Please make sure that correct Title, Amount, Date and Catagory was entered"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Okay"))
          ],
        ),
      );
      return;
    }

    // Method 1 to send expense data using the Navigator.pop()
    // Navigator.pop(
    //     context,
    //     Expense(
    //         title: _titleController.text,
    //         amount: enteredAmount,
    //         date: _selectedDate!,
    //         catagory: _selectedCatagory));

    // Method 2 by using the passby address
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        catagory: _selectedCatagory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // we should always use this dispose method on the controller after their usage otherwise they would cause memory lekage and lead to crashing
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            // keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "\$",
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? "No Date Selected"
                        : formatter.format(
                            _selectedDate!)), // here we add an exclamation to say that the value is not null
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCatagory,
                items: Catagory.values
                    .map((catagory) => DropdownMenuItem(
                          value: catagory,
                          child: Text(catagory.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    // writing a if check to check if the value is not null
                    return;
                  }
                  setState(() {
                    _selectedCatagory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(
                width: 4,
              ),
              ElevatedButton(
                onPressed: () {
                  _submitExpenseDate();
                },
                child: const Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
