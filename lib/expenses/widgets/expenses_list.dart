import 'package:fh_clone/common/card.dart';
import 'package:fh_clone/expenses/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenesesList extends StatelessWidget {
  final List<ExpenseModel> expensesList;
  const ExpenesesList({super.key, required this.expensesList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) {
        return ExpenseCard(expense: expensesList[index]);
      },
    );
  }
}
