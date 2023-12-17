import 'package:basics/models/expense.dart';
import 'package:basics/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onRemoveExpense,
      required this.onUpdateExpense});

  final List<Expense> expenses;
  final Function(Expense) onRemoveExpense;
  final Function(Expense,Expense) onUpdateExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (cxt, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            // margin: const EdgeInsets.symmetric(
            //     horizontal:
            //         16), // one way to get margin manually OR by using the theme.of(context) and then using the default theme of the settings we applied to the theme of the entire app

            // margin: Theme.of(context).cardTheme.margin,

            // OR
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context)
                    .cardTheme
                    .margin!
                    .horizontal), // it shows an error because the margin of the cardTheme can be possible be null
          ),
          key: ValueKey(expenses[
              index]), // here we have to create a value key because it is important to know which expense to remove
          onDismissed: (direction) => onRemoveExpense(expenses[index]),
          child: ExpenseItem(
            expenses[index],
            expenses: expenses,
            onUpdateExpense: onUpdateExpense,
          )),
    ); // here we use listview builder for optimization purpose
  }
}
