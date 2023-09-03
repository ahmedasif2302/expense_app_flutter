import 'package:fh_clone/common/card.dart';
import 'package:fh_clone/expenses/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenesesList extends StatelessWidget {
  final List<ExpenseModel> expensesList;
  const ExpenesesList(
      {super.key, required this.expensesList, required this.removeExpense});
  final void Function(ExpenseModel expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          onDismissed: (direction) {
            removeExpense(expensesList[index]);
          },
          key: ValueKey(expensesList[index]),
          child: ExpenseCard(expense: expensesList[index]),
        );
      },
    );
  }
}
