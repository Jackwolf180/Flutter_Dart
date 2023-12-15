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


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        Text("The Chart"),
        Text("Expenses List"),
      ]),
    );
  }
}
