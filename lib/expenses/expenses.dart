import 'package:fh_clone/expenses/models/expense_model.dart';
import 'package:fh_clone/expenses/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseModel> _expensesList = [
    ExpenseModel(
        title: 'Petrol',
        amount: 300.00,
        category: Categories.travel,
        date: DateTime.now()),
    ExpenseModel(
        title: 'Food',
        amount: 75.00,
        category: Categories.food,
        date: DateTime.now()),
    ExpenseModel(
        title: 'Cinema',
        amount: 175.00,
        category: Categories.leisure,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The Charts"),
          Expanded(
            child: ExpenesesList(expensesList: _expensesList),
          ),
        ],
      ),
    );
  }
}
