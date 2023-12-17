import 'package:basics/models/expense.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.onAddExpense})
      : initialExpenseData = Expense(
            title: "",
            amount: -1,
            date: DateTime.now(),
            catagory: Catagory.leisure);
  NewExpense.updateExpense(
      {super.key,
      required this.onUpdateExpense,
      required this.initialExpenseData});

  late Function(Expense) onAddExpense;
  late Function(Expense, Expense) onUpdateExpense;
  final Expense initialExpenseData;

  @override
  State createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime?
      _selectedDate; // we  use ? to tell that the selectedDate can possibly be null

  Catagory _selectedCatagory = Catagory.leisure;
  @override
  void initState() {
    if (widget.initialExpenseData.amount != -1) {
      _selectedDate = widget.initialExpenseData.date;
      _selectedCatagory = widget.initialExpenseData.catagory;
      _titleController.value =
          TextEditingValue(text: widget.initialExpenseData.title);
      _amountController.value =
          TextEditingValue(text: widget.initialExpenseData.amount.toString());
    }
    super.initState();
  }

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

  void _submitExpenseData() {
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

    Expense finalExpenseData = Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        catagory: _selectedCatagory);
    widget.initialExpenseData.amount == -1
        ? widget.onAddExpense(finalExpenseData)
        : widget.onUpdateExpense(widget.initialExpenseData, finalExpenseData);
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
    final keyboardSpace = MediaQuery.of(context)
        .viewInsets
        .bottom; // This helps us to know which UI element is at bottom of the screen.
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
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
                      _submitExpenseData();
                    },
                    child: const Text("Save Expense"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
