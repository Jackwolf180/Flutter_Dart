import 'package:basics/widgets/expenses_list.dart';
import 'package:basics/models/expense.dart';
import 'package:basics/widgets/new_expense.dart';
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

// Method 1 to add new Expenses to the list using navigator.pop()
  // void _openAddExpenseOverlay() async{
  //   Expense newExpense= await showModalBottomSheet(context: context, builder: (ctx)=> const NewExpense());// here we alread have an globally avialabe context propery made aviallabel by flutter in statefulWidget
  //   setState(() {
  //     _registerdExpenses.add(newExpense);
  //   });
  // }

// Method 2 by using pass by address
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    ); // here we alread have an globally avialabe context propery made aviallabel by flutter in statefulWidget
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _registerdExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerdExpenses.indexOf(expense);
    setState(() {
      _registerdExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        // this is used to show snackbars for messages
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registerdExpenses.insert(expenseIndex, expense);
            });
          },
        ),
        content: const Text("Expense deleted")));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text("No Expenses found. Start Adding one."));
    if (_registerdExpenses.isNotEmpty) {
      mainContent = Column(children: [
        const Text("The Chart"),
        Expanded(
            child: ExpensesList(
          expenses: _registerdExpenses,
          onRemoveExpense: _removeExpense,
        )), // here we use expended because in case of column or colume like widget the list takes infinite heigth
      ]);
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Expense Tracker"), actions: [
        IconButton(
            onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
      ]),
      body: mainContent,
    );
  }
}
