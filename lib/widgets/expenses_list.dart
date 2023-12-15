
import 'package:basics/models/expense.dart';
import 'package:basics/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cxt, index) => ExpenseItem(expenses[index]),
    ); // here we use listview builder for optimization purpose
  }
}
