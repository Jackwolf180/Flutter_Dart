import 'package:basics/models/expense.dart';
import 'package:basics/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cxt, index) => Dismissible(
          key: ValueKey(expenses[
              index]), // here we have to create a value key because it is important to know which expense to remove
          onDismissed: (direction) => onRemoveExpense(expenses[index]),
          child: ExpenseItem(expenses[index])),
    ); // here we use listview builder for optimization purpose
  }
}
