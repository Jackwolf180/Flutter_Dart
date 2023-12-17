import 'package:basics/models/expense.dart';
import 'package:basics/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatefulWidget {
  const ExpenseItem(this.expense, {super.key, required this.expenses, required this.onUpdateExpense});

  final Expense expense;
  final List<Expense> expenses;
  final Function(Expense,Expense) onUpdateExpense;

  @override
  State<ExpenseItem> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  void _openEditExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea:
          true, // this ensures that the ui elements does not exceeds the upper area where camera and other elements are present
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense.updateExpense(
          initialExpenseData: widget.expense, onUpdateExpense: widget.onUpdateExpense),
    ); // here we alread have an globally avialabe context propery made aviallabel by flutter in statefulWidget
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openEditExpenseOverlay,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.expense.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge, // here we can also use the copyWith() here
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text('\$${widget.expense.amount.toStringAsFixed(2)}'),
                  const Spacer(), // this widget is used to take all the space in between the widget
                  Row(
                    children: [
                      Icon(catagoryIcons[widget.expense.catagory]),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(widget.expense.formattedDate)
                    ],
                  ) // this is used to diaplay to certain significant figure
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
