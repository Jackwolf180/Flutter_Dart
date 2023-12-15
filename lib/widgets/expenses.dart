import 'package:basics/widgets/expenses_list.dart';
import 'package:basics/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        catagory: Catagory.work),
    Expense(
        title: 'Cinema',
        amount: 20,
        date: DateTime.now(),
        catagory: Catagory.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx)=> Text("Modal Bottom Sheet"));// here we alread have an globally avialabe context propery made aviallabel by flutter in statefulWidget 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Expense Tracker"), actions: [
        IconButton(
            onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
      ]),
      body: Column(children: [
        const Text("The Chart"),
        Expanded(
            child: ExpensesList(
                expenses:
                    _registerdExpenses)), // here we use expended because in case of column or colume like widget the list takes infinite heigth
      ]),
    );
  }
}
