import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Catagory { food, travel, leisure, work }

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.catagory})
      : id = uuid.v4();// The initialization part where we can initialize the values 


  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catagory
      catagory; // this can introduce error because the user can add any value
}
